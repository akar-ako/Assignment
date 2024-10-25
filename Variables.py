
# Variables

URL = "https://rahulshettyacademy.com/seleniumPractise/#/"
# ProductPlusIcon = "//div[@class='products']//div[1]//div[2]//a[2]"
# AddToCartIcon = "//div[@class='products']//div[1]//div[3]//button[1]"
# InputElement = "//*[@id='root']/div/div[1]/div/div[1]/div[2]/input"

# Dynamically set product information for checkout:
# This allows flexible testing for various products, quantities, and countries during checkout flow.
ProductName = "Cauliflower - 1 Kg"
OrderedProductNumber = 5
SelectedCountry = "Iraq"
num2 = 1

# This dynamically inserts the ProductName into the XPath string using Python's f-string formatting.
ProductPlusIcon = f"//div[@class='product' and h4[contains(text(),'{ProductName}')]]//a[contains(@class,'increment')]"
AddToCartIcon = f"//div[@class='product' and h4[contains(text(),'{ProductName}')]]//button[text()='ADD TO CART']"
InputElement = f"//*[@id='root']/div/div[1]/div/div[h4[contains(text(),'{ProductName}')]]/div[2]/input"


CartIcon = "//*[@id='root']/div/header/div/div[3]/a[4]/img"
ProceedToCheckoutButton = "//*[@id='root']/div/header/div/div[3]/div[2]/div[2]/button"
CountriesDropdown = "//*[@id='root']/div/div/div/div/div/select"
TermsCheckBox = "//*[@id='root']/div/div/div/div/input"
ProceedButton = "//*[@id='root']/div/div/div/div/button"


# ProductNameElementPath = "//div[@class='cart-preview active']//div//div//p[@class='product-name'][normalize-space()='Brocolli - 1 Kg']"
ProductNameElementPath = f"//div[@class='cart-preview active']//div//div//p[@class='product-name'][normalize-space()='{ProductName}']"
ProductPriceElementPath = "//*[@id='root']/div/header/div/div[3]/div[2]/div[1]/div[1]/ul/li/div[1]/p[2]"
ProductQuantityElementPath = "//*[@id='root']/div/header/div/div[3]/div[2]/div[1]/div[1]/ul/li/div[2]/p[1]"
ProductTotalPriceElementPath = "//*[@id='root']/div/header/div/div[3]/div[2]/div[1]/div[1]/ul/li/div[2]/p[2]"

ProductNameElementPath2 = "//*[@id='productCartTables']/tbody/tr/td[2]/p"
ProductPriceElementPath2 = "//*[@id='productCartTables']/tbody/tr/td[4]/p"
ProductQuantityElementPath2 = "//*[@id='productCartTables']/tbody/tr/td[3]/p"
ProductTotalPriceElementPath2 = "//*[@id='productCartTables']/tbody/tr/td[5]/p"

