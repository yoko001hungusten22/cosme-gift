class MainController < ApplicationController
    def index
    end
  
    def gift
        @petitprice = [
            {
                "brand_name" => "ブランド名1",
                "products" => [
                  {"item_name" => "商品名1", "price" => 2000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"}, 
                  {"item_name" => "商品名2", "price" => 2000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"},
                ]
            },
            {
                "brand_name" => "ブランド名2",
                "products" => [
                  {"item_name" => "商品名1", "price" => 2000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"}, 
                  {"item_name" => "商品名2", "price" => 2000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"},
                ]
            }
        ]
        
        @lowprice = [
            {
                "brand_name" => "ブランド名1",
                "products" => [
                  {"item_name" => "商品名1", "price" => 2000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"}, 
                  {"item_name" => "商品名2", "price" => 2000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at"=> Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"},
                ]
            },
            {
                "brand_name" => "ブランド名2",
                "products" => [
                  {"item_name" => "商品名1", "price" => 2000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"}, 
                  {"item_name" => "商品名2", "price" => 2000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"},
                ]
            }
        ]
        
        
        @middleprice = [
            {
                "brand_name" => "ブランド名1",
                "products" => [
                  {"item_name" => "商品名1", "price" => 5000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"}, 
                  {"item_name" => "商品名2", "price" => 5000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"},
                ]
            },
            {
                "brand_name" => "ブランド名2",
                "products" => [
                  {"item_name" => "商品名1", "price" => 5000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" =>Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"}, 
                  {"item_name" => "商品名2", "price" => 5000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"},
                ]
            }
        ]
        
        @highprice = [
            {
                "brand_name" => "ブランド名1",
                "products" => [
                  {"item_name" => "商品名1", "price" => 10000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"}, 
                  {"item_name" => "商品名2", "price" => 10000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"},
                ]
            },
            {
                "brand_name" => "ブランド名2",
                "products" => [
                  {"item_name" => "商品名1", "price" => 10000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"}, 
                  {"item_name" => "商品名2", "price" => 10000, "image_url" => "https://cdn-cosme.net/media/product/0/skuimg_745867.jpg", "release_at" => Date.today, "shopping_link" => "https://ssl.cosme.net/cosme/asp/buy/buy0010.asp?product_id=10120578"},
                ]
            }
        ]
    end
end