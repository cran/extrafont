setwd('Z:/Dropbox/Projects/extrafont')
.dm()

install('../extrafontdb')
install('../Rttf2pt1')
.la()

font_import()


# Compiling all
setwd('Z:/Dropbox/Projects/Rttf2pt1/src')
system("make all")


# Compiling freetype
setwd('Z:/Dropbox/Projects/Rttf2pt1/src/freetype2')
system("make distclean")
system("make CC='gcc -c -m32 -DWINDOWS -std=gnu99 ' PLATFORM=ansi CONFIG_FILE=ansi.mk std_setup")
system("make CC='gcc -c -m32 -DWINDOWS -std=gnu99 '")
# system("make CONFIG_FILE=w32-mingw32.mk std_setup")
# system("make CC='gcc -fno-leading-underscore'")

z <- system2("nm", "objs/libfreetype.a", stdout=TRUE)
z[grep("FT_Get_Kerning", z)]
z[grep("FT_Load_Glyph", z)]

# Compiling rttf2pt1
setwd('Z:/Dropbox/Projects/Rttf2pt1/src/ttf2pt1')
system("make veryclean")
# system("make ttf2pt1 CFLAGS='-O3 -Wall -std=gnu99 -mtune=core2 -m32 -DWINDOWS -DUSE_FREETYPE -I../freetype2/include -L../freetype2/objs -lfreetype'")
system("make ttf2pt1 CFLAGS='-O3 -Wall -std=gnu99 -mtune=core2 -m32 -DWINDOWS -DUSE_FREETYPE -I../freetype2/include' LIBS_FT='-L../freetype2/objs -lfreetype'")

system("gcc -O3 -Wall -std=gnu99 -mtune=core2 -m32 -DWINDOWS -DUSE_FREETYPE -I../freetype2/include -o ttf2pt1 ttf2pt1.o pt1.o runt1asm.o ttf.o ft.o bdf.o bitmap.o -lm")
system("gcc -O3 -Wall -std=gnu99 -mtune=core2 -m32 -DWINDOWS -DUSE_FREETYPE -I../freetype2/include -L../freetype2/objs -lfreetype -o ttf2pt1 ttf2pt1.o pt1.o runt1asm.o ttf.o ft.o bdf.o bitmap.o -lm")


system2("ldconfig", stdout=T)
Sys.setenv(LD_LIBRARY_PATH="Z:/Dropbox/Projects/Rttf2pt1/src/freetype2/objs")
x <- as.list(Sys.getenv())
x$LD_LIBRARY_PATH
