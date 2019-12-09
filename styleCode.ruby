#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
 
$i = 0
$num = 5

# 字号 9 种：27,20,18,16,14,12,11,10,9
# 颜色 5 种：gray1,gray2,red,white,golden
# 字重 3 种：bold,regular,light
font_sizes = ['27','20','18','16','14','14_read','12','11','10','9']
general_colors = ['gray1', 'gray2', 'red', 'white', 'gold']
font_weights = ['bold', 'regular', 'light']
text_extra = ['read']
#  textstyle，3 层循环输出
i = 0
while i < font_sizes.size do
   font = font_sizes[i]
   j = 0
   while j < general_colors.size do
    color = general_colors[j]
    k = 0
    while k < font_weights.size do 
      weight = font_weights[k]
      if font == '14_read'
         puts("static YXStyleCode *const YXCode_14_#{color}_#{weight}_read = @\"14_#{color}_#{weight}_read\";" )
      else
         puts("static YXStyleCode *const YXCode_#{font}_#{color}_#{weight} = @\"#{font}_#{color}_#{weight}\";" )
      end
      
      k +=1
    end
    j +=1
   end
   if font == '14_read'
      puts '///用于评论的文字格式'
   else 
      puts ''
   end
   i +=1
end

# font 2 层输出
puts '/// 字体样式'
i = 0
while i < font_sizes.size do
   font = font_sizes[i]
   k = 0
   font = font_sizes[i]
   if font == '14_read'
      i +=1
      next
   end
    while k < font_weights.size do 
      weight = font_weights[k]
      puts("static YXStyleFontSize *const YXFont_#{font}_#{weight} = @\"#{font}_#{weight}\";" )
      k +=1
    end
    puts ''
   i +=1
end
