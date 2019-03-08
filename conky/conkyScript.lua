--this is a lua script for use in conky
require 'cairo'

function conky_main()
    if conky_window == nil then
        return
    end
    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width,
                                         conky_window.height)
    cr = cairo_create(cs)


    --SETTINGS FOR CPU INDICATOR BAR
    bar_bottom_left_x= 50
    bar_bottom_left_y= 200
    bar_width= 30
    bar_height= 100
    --set bar background colors, 1,0,0,1 = fully opaque red
    bar_bg_red=1
    bar_bg_green=0
    bar_bg_blue=0
    bar_bg_alpha=1
    --set indicator colors, 1,1,1,1 = fully opaque white
    bar_in_red=1
    bar_in_green=1
    bar_in_blue=1
    bar_in_alpha=1










    font="Mono"
    font_size=12
    text="Hello, Kitan"
    xpos,ypos=50,100
    red,green,blue,alpha=1,1,1,1
    font_slant=CAIRO_FONT_SLANT_NORMAL
    font_face=CAIRO_FONT_WEIGHT_NORMAL
    ----------------------------------
    cairo_select_font_face (cr, font, font_slant, font_face);
    cairo_set_font_size (cr, font_size)
    cairo_set_source_rgba (cr,red,green,blue,alpha)
    cairo_move_to (cr,xpos,ypos)
    cairo_show_text (cr,text)
    cairo_stroke (cr)

    --TO DRAW A LINE--
    line_cap=CAIRO_LINE_CAP_BUTT
    red,green,blue,alpha=1,1,1,1
    startx=380
    starty=290
    line_width=400
    cairo_set_line_cap (cr, line_cap)
    cairo_set_source_rgba (cr, red,green,blue,alpha)
    cairo_move_to (cr, startx, starty)
    cairo_rel_line_to (cr, 300, -520)
    --cairo_line_to (cr, 300,200) same as line above--
    cairo_stroke (cr)
    ----------------------------------
    --
    --
    --
    --
    --
    --Draw Bar Graph Background--
    cairo_set_source_rgba (cr,bar_in_red,bar_in_green,bar_in_blue,bar_in_alpha)--set indicator color
    value=tonumber(conky_parse("${cpu}"))
    max_value=100
    scale=bar_height/max_value
    indicator_height=scale*value
    cairo_rectangle (cr,bar_bottom_left_x,bar_bottom_left_y,bar_width,-indicator_height)
    cairo_fill (cr)





    --For Ring Graph--
    --SETTINGS
    --rings size
    ring_center_x=200
    ring_center_y=200
    ring_radius=50
    ring_width=20
    --colors
    --set background colors, 1,0,0,1 = fully opaque red
    ring_bg_red=.82
    ring_bg_green=.82
    ring_bg_blue=.9
    ring_bg_alpha=.5
    --set indicator colors, 1,1,1,1 = fully opaque white
    ring_in_red=0
    ring_in_green=.746
    ring_in_blue=1
    ring_in_alpha=1
    --indicator value settings
    value=conky_parse("${cpu}")
    max_value=100


    --draw background
    cairo_set_line_width (cr,ring_width)
    cairo_set_source_rgba (cr,ring_bg_red,ring_bg_green,ring_bg_blue,ring_bg_alpha)
    cairo_arc (cr,ring_center_x,ring_center_y,ring_radius,0,2*math.pi)
    cairo_stroke (cr)

    --draw indicator
    cairo_set_line_width (cr,ring_width)
    end_angle=value*(360/max_value)
    --print (end_angle)
    cairo_set_source_rgba (cr,ring_in_red,ring_in_green,ring_in_blue,ring_in_alpha)
    cairo_arc (cr,ring_center_x,ring_center_y,ring_radius,(-90)*(math.pi/180),(end_angle-90)*(math.pi/180))
    cairo_stroke (cr)


    textCPU="CPU"
    textCPUSize=25
    CPUx,CPUy=177,205
    ----------------------------------
    cairo_select_font_face (cr, font, font_slant, font_face);
    cairo_set_font_size (cr, textCPUSize)
    cairo_set_source_rgba (cr,0,0,1,alpha)
    cairo_move_to (cr,CPUx,CPUy)
    cairo_show_text (cr,textCPU)
    cairo_stroke (cr)





    local updates=tonumber(conky_parse('${updates}'))
    if updates>5 then
        print ("hello world")
    end
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr=nil
end
