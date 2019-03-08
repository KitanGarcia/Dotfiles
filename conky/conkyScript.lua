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



    local updates=tonumber(conky_parse('${updates}'))
    if updates>5 then
        print ("hello world")
    end
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr=nil
end
