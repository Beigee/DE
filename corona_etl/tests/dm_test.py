import time
import unittest
from pyspark.sql.functions import udf
from pyspark.sql.functions import col, pandas_udf, split
from datajob.datamart.co_popu_density import CoPopuDensity
from datajob.datamart.co_vaccine import CoVaccine
from infra.spark_session import get_spark_session
from infra.util import cal_std_day
from selenium import webdriver
from selenium.webdriver.common.by import By
from pyvirtualdisplay import Display
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class MTest(unittest.TestCase):

    def test1(self):
        CoPopuDensity.save()

    def test2(self):
        CoVaccine.save()

    def test3(self):
            display = Display(visible=0, size=(1920, 1080))
            display.start()
            path='/home/big/chromedriver'
            driver = webdriver.Chrome(path)
            driver.get("https://www.naver.com")
            driver.implicitly_wait(10)
            driver.find_element(By.CSS_SELECTOR, "#NM_NEWSSTAND_DEFAULT_THUMB > div._NM_UI_PAGE_CONTAINER > div:nth-child(2) > div > div.thumb_area > div:nth-child(1)")

            text_box = driver.page_source
            #print(text_box)

if __name__ == "__main__":
    """ This is executed when run from the command line """
    unittest.main()