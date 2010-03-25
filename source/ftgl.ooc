use ftgl
use glew
import glew

include FTGL/ftgl

FTGLfont: extern cover
FTGL_RENDER_ALL: extern Int
ftglSetFontFaceSize: extern func(...)
ft_encoding_unicode: extern Int


Ftgl: class {
	font: FTGLfont*
	
	init: func(x,y: Int,filename: String) {
		font = createTextureFont(filename)
		setFontFaceSize(font,x,y)
		setFontCharMap(font,ft_encoding_unicode)
		printf("Loaded font: %s\n",filename)
	}
	
	render: func(x,y,s: Double, mirror: Bool, text: String) {
		glPushMatrix()
		glTranslated(x, y, 0)
		glScaled(s, s, s);
		if(mirror) {
			glRotated(180, 1, 0, 0)
		}
		renderFont(font,text,FTGL_RENDER_ALL)
		glPopMatrix()
	}
	
	
	renderFont: extern(ftglRenderFont) static func(FTGLfont*,String,Int)
	setFontFaceSize: extern(ftglSetFontFaceSize) static func(FTGLfont*,Int,Int)
	setFontCharMap: extern(ftglSetFontCharMap) static func(FTGLfont*,Int)
	createTextureFont: extern(ftglCreateTextureFont) static func(String)
}


