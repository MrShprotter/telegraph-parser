import requests, sys
from bs4 import BeautifulSoup as BS

r = requests.get(sys.argv[1])
html = BS(r.content, "html.parser")

for el in html.select(".tl_article_content > figure > img"):
    s = f"https://telegra.ph{el.get_attribute_list('src')[0]}"
    print(s)
