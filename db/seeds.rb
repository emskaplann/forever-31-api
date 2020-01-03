require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# Variant.delete_all
# VariantImage.delete_all
# Product.delete_all
# ProductImage.delete_all

url = URI("https://apidojo-forever21-v1.p.rapidapi.com/products/list?maxprice=250&sort=popular&category=women-new-arrivals&page=1&pagesize=45")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'apidojo-forever21-v1.p.rapidapi.com'
request["x-rapidapi-key"] = '55f127f24amsh0cba5dc866c135dp1dbaefjsnbff133351003'

response = http.request(request)
parsed_response = JSON.parse(response.body)
# How to reach to response?
# parsed_response["CatalogProducts"][0] => will give you first item props.
# VariantImage.delete_all
# Variant.delete_all
# ProductImage.delete_all
# Product.delete_all

# ChildCategory.delete_all
# Category.delete_all
women = Category.create(name: "Women New Arrivals", gender: "women")
w_new_arrivals = ChildCategory.create(category_id: Category.all.last.id, name: "new-arrivals", gender: "women")
parsed_response["CatalogProducts"].each do |product|
  product1 = Product.create(
    brand: product["Brand"],
    category_name: product["CategoryName"],
    coming_soon: product["ComingSoon"],
    description: product["Description"],
    description_of_deal: product["DescriptionOfDeal"],
    display_name: product["DisplayName"],
    free_shipping: product["FreeShippingDescription"],
    image_extension: product["ImageFilename"],
    student_deal: product["IsAvailableStudentDeal"],
    item_code: product["ItemCode"],
    on_sale: product["OnSale"],
    orig_product_id: product["OrigProductId"],
    product_share_link: product["ProductShareLinkUrl"],
    product_size_chart: product["ProductSizeChart"],
    list_price: "$#{product["ListPrice"].to_s}",
    shipping_fee: "$2.99",
    child_category_id: w_new_arrivals.id
  )
  # Creating Image For Product
  #  example image link => https://www.forever21.com/images/4_full_750/00375850-03.jpg
  ProductImage.create(
    front_url: "https://www.forever21.com/images/1_front_750/#{product["ImageFilename"]}",
    side_url: "https://www.forever21.com/images/2_side_750/#{product["ImageFilename"]}",
    back_url: "https://www.forever21.com/images/3_back_750/#{product["ImageFilename"]}",
    full_url: "https://www.forever21.com/images/4_full_750/#{product["ImageFilename"]}",
    detail_url: "https://www.forever21.com/images/5_detail_750/#{product["ImageFilename"]}",
    small_front_url: "https://www.forever21.com/images/1_front_58/#{product["ImageFilename"]}",
    small_side_url: "https://www.forever21.com/images/2_side_58/#{product["ImageFilename"]}",
    small_back_url: "https://www.forever21.com/images/3_back_58/#{product["ImageFilename"]}",
    small_full_url: "https://www.forever21.com/images/4_full_58/#{product["ImageFilename"]}",
    small_detail_url: "https://www.forever21.com/images/5_detail_58/#{product["ImageFilename"]}",
    product_id: product1.id
  )
  if product["Variants"].class.to_s == "Array"
    # Creating Variant For Product
    product["Variants"].each do |variant|
      variant1 = Variant.create(
        color_name: variant["ColorName"],
        color_id: variant["ColorId"],
        image_extension: variant["ImageFileName"],
        list_price: variant["ListPrice"],
        product_id: product1.id
      )
    # Creating Images For Variants
    new_extension = "#{variant["ImageFileName"][0..8]}#{variant1.color_id}.jpg"
      VariantImage.create(
        front_url: "https://www.forever21.com/images/1_front_750/#{new_extension}",
        side_url: "https://www.forever21.com/images/2_side_750/#{new_extension}",
        back_url: "https://www.forever21.com/images/3_back_750/#{new_extension}",
        full_url: "https://www.forever21.com/images/4_full_750/#{new_extension}",
        detail_url: "https://www.forever21.com/images/5_detail_750/#{new_extension}",
        small_front_url: "https://www.forever21.com/images/1_front_58/#{new_extension}",
        small_side_url: "https://www.forever21.com/images/2_side_58/#{new_extension}",
        small_back_url: "https://www.forever21.com/images/3_back_58/#{new_extension}",
        small_full_url: "https://www.forever21.com/images/4_full_58/#{new_extension}",
        small_detail_url: "https://www.forever21.com/images/5_detail_58/#{new_extension}",
        variant_id: variant1.id
      )
    end
  end
end

# byebug
# 0
