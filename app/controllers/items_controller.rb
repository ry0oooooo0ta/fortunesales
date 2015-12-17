class ItemsController < ApplicationController
  require 'open-uri'
  def index
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows IE 7'
    category = ["",
                "",
                "",
                "",
                ]
    @category = category.sample
    @page1 = agent.get ('http://www.amazon.co.jp/gp/product/B010UV23ZI/ref=s9_simh_gw_p23_d0_i1?pf_rd_m=AN1VRQENFRJN5&pf_rd_s=desktop-7&pf_rd_r=0ZQNZVDRWAR4ZHP3X78V&pf_rd_t=36701&pf_rd_p=205640769&pf_rd_i=desktop')
    @image = @page1.search('#imgTagWrapperId').at('img')['src']
    @original_price = @page1.search('td.a-text-strike').inner_text
    @new_price = @page1.search("#priceblock_ourprice").inner_text
    @s = @page1.search("td.a-color-price").inner_text
    @discount_rate = @s.match(/(\()(\d+%)(\))/).to_a[2]
  end
end
