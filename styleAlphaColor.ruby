#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

#https://www.jianshu.com/p/6dd8624662ff

def blend_color_with_alpha (color, a2)

    matchData = /^(\w{2})(\w{2})(\w{2})$/.match(color)
    # https://stackoverflow.com/questions/6002839/initialize-two-variables-on-same-line
    a1 = 1 #0.8 # 光从白色，透过前面半透明的前景色，到的人眼
    r1 = 0xff
    g1 = 0xff
    b1 = 0xff

    r2 = matchData[1].to_i(base=16)
    g2 = matchData[2].to_i(base=16)
    b2 = matchData[3].to_i(base=16)

    r = r1 * a1 * (1 - a2) + r2 * a2
    g = g1 * a1 * (1 - a2) + g2 * a2
    b = b1 * a1 * (1 - a2) + b2 * a2

    # puts "#{r} #{g} #{b}"

    return "#%02x%02x%02x" % [r.round, g.round, b.round]
end

names = ['YXColor_brand','YXColor_yellow','YXColor_superMember']
idx = 0
['dd1a21', 'f48f18', 'c3945b'].each do |c|
    puts ''

    [0.8, 0.6, 0.4, 0.2, 0.1].each do |a|
        puts "static YXStyleColor *const #{names[idx]}_#{(a * 100).to_i} = @\"#{blend_color_with_alpha(c, a).upcase}\";"
    end
    idx += 1
end