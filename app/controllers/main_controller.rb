class MainController < ApplicationController
  def index
  end

  def gift_new
    year = Date.today.year
    month = Date.today.month  #  TODO: 次イベントの判定ロジックが実装され次第それに換装
    params = URI.encode_www_form({client_id: '8f58b3318661f361f8e9b132ac356867d25ff005b4205b20eb1ce7f191cc0ccd'})
    uri = URI.parse("https://pf-api.cosme.net/cosme/v3/product_releases/#{year}/#{month}?#{params}")
    raw_hash = exec_api(uri)
    result = convert_with_price(raw_hash["results"])
    @petitprice, @lowprice, @middleprice, @highprice = *result
  end

  def gift_rank
    params = URI.encode_www_form({
      count: 50,
      client_id: '8f58b3318661f361f8e9b132ac356867d25ff005b4205b20eb1ce7f191cc0ccd'
    })
    uri = URI.parse("https://pf-api.cosme.net/cosme/v2/ranking/products?#{params}")
    raw_hash = exec_api(uri)
    @ranking = convert_with_rank(raw_hash)
  end

  def gift_recommend
  end

  def gift_event
  end

  def gift_month
  end
end


def exec_api(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)
    raw_hash = JSON.parse(res.body)
    return raw_hash
end

def convert_with_price(raw_hash)
  group_by_price_range = [{}, {}, {}, {}]
  for res_hash in raw_hash
    release_at, brands = res_hash["date"], res_hash["brands"]
    for brand in brands
      brand_name = brand["brand_name"]
      for group in group_by_price_range
        group[brand_name] = [] if !group.has_key?(brand_name)
      end
      for product in brand["products"]
        if product["sku"]["volume_sales"].length.zero?
          next
        end
        price = product["sku"]["volume_sales"][0]["sales"]["price_value_from"]
        if product["image_url"].nil?
          product["image_url"] = "https://lh3.googleusercontent.com/proxy/q9K-584jea7P1JJu_HKizXAOZRuGvhq3hqpTF_mMamAgF9vr8NBtWUgLeGnHUx0yPjZnR3sI26QeTbWfUlDynP6Y3oayozuRRdqKFY8"
        end
        prod = {
          "item_name" => product["product_name"],
          "price" => price,
          "image_url" => product["image_url"],
          "release_at" => Date.strptime(release_at,'%Y-%m-%d'),
          "shopping_link" => product["shopping_link"]
        }
        group_by_price_range[rate_index(price.to_i)][brand_name].push(prod)
      end
    end
  end
  group_by_price_range.each_with_index{|group, index|
    new_group = []
    group.each{|brand_name, products|
      if products.length.zero?
        next
      end
      new_group.push({"brand_name"=>brand_name, "products" => products})
    }
    group_by_price_range[index] = new_group
  }
  return group_by_price_range
end

def rate_index(price)
  if price < 2000 then
    return 0
  elsif price < 5000
    return 1
  elsif price < 10000
    return 2
  else
    return 3
  end
end

def convert_with_rank(raw_hash)
  converted_rank = []
  for rank in raw_hash["result"]
    item = {
        'rank'=> rank['rank'],
        'item_name'=> rank['product_name'],
        'brand_name'=> rank['brand_name'],
        'volume_price_label'=> rank['volume_price_label'],
        'image_url'=> rank['image_url'],
        'shopping_link'=> rank['shopping_link']
    }
    converted_rank.append(item)
  end
  return converted_rank
end

# date:String (example: date = "0125")
def date2event(date)
  if date <= "0115" then
    return "coming_of_age"
  elsif date <= "0214" then
    return "valentine"
  elsif date <= "0314" then
    return "white"
  elsif date <= "0331" then
    return "graduation"
  elsif date <= "0415" then
    return "entrance"
  elsif date <= "0505" then
    return "childrens"
  elsif date <= "0515" then
    return "mothers"
  elsif date <= "0615" then
    return "fathers"
  elsif date <= "0921" then
    return "thanksgiving"
  elsif date <= "1031" then
    return "halloween"
  elsif date <= "1225" then
    return "christmas"
  elsif date <= "1231" then
    return "coming_of_age"
  else
    return false
  end
end

def month_from_event_name(event)
  if event == "coming_of_age" then
    return [12,1]
  elsif event == "valentine" then
    return [1,2]
  elsif event == "white" then
    return [2,3]
  elsif event == "graduation" then
    return [2,3]
  elsif event == "entrance" then
    return [3,4]
  elsif event == "childrens" then
    return [4,5]
  elsif event == "mothers" then
    return [4,5]
  elsif event == "fathers" then
    return [5,6]
  elsif event == "thanksgiving" then
    return [8,9]
  elsif event == "halloween" then
    return [9,10]
  elsif event == "christmas" then
    return [11,12]
  elsif event == "birthday" then
    month = Date.today.month
    return [month,month+1]
  end
end