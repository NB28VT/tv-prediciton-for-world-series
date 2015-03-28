require 'watir-webdriver'
require 'csv'
b = Watir::Browser.new
url ='http://en.wikipedia.org/wiki/2000_World_Series#Summary'
b.goto url

skipfirstrow = 0
for  row in b.table(:class => 'wikitable').tbody.trs
  if (skipfirstrow==1)
    skipfirstrow = 1
  else
    print row.tds[6].text
  end
end

b.close

