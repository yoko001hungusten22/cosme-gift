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