# Test code

.dm()
#load_all('.',T)
library(fonts)

loadfonts()

library(ggplot2)
pdf('fontcm.pdf', width=4`, height=4)

# Base plot
p <- qplot(c(1,5), c(1,5)) +
  xlab("Made with extrafont") + ylab("Made with extrafont") +
  opts(title = "Made with extrafont")

# Equation
eq <- "sum(frac(1, n*'!'), n==0, infinity) == lim(bgroup('(', 1 + frac(1, n), ')')^n, x %->% infinity)"

# Without the new fonts
p + annotate("text", x=3, y=3, parse=TRUE, label=eq)

# With the new fonts
p + annotate("text", x=3, y=3, parse=TRUE, family="CM Roman", label=eq) +
  opts(plot.title = theme_text(size=16, family="CM Roman")) +
  opts(axis.title.x = theme_text(size=16, family="CM Roman", face="italic")) +
  opts(axis.title.y = theme_text(size=16, family="CM Sans", face="bold", angle=90))

dev.off()

# Embed the fonts
embed_fonts('fontcm.pdf', outfile='fontcm-embed.pdf')


# Testing otf and ttc ==================
font_import()

loadfonts()

pdf('fonttest.pdf', width=4, height=4)
library(ggplot2)
p <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + xlab("This is the x label") +
     theme(axis.title.x=element_text(size=24, colour="red"))

p + theme(axis.title.x=element_text(family="Impact"))

# On Linux, Purisa and/or Droid Serif may be available
p + theme(axis.title.x=element_text(family="Futura"))
p + theme(axis.title.x=element_text(family="Copperplate"))
p + theme(axis.title.x=element_text(family="Optima", face="italic"))
p + theme(axis.title.x=element_text(family="Palatino", face="italic"))
p + theme(axis.title.x=element_text(family="Papyrus"))
p + theme(axis.title.x=element_text(family="CM Roman"))
dev.off()

embed_fonts('fonttest.pdf', outfile='fonttest-embed.pdf')



# Missing hypehns ============
install("~/Dropbox/Projects/extrafontdb")
font_import(pattern="Arial")
font_import()

R
.dm()
.la("~/Dropbox/Projects/extrafont")
loadfonts()
set.seed(23)
z <- rnorm(500)

pdf("Arial-ggplot2.pdf")
library(ggplot2)
qplot(-5:5, -5:5) + theme(text = element_text(family="Arial")) +
  annotate("text", label="1+2-5", parse=TRUE, x=2, y=-2)
dev.off()

pdf("Arialz.pdf", family="Arial")
hist(z, main="Histogram of -- Standard Z", xlim=c(-5, 5))
text(x=-3, y=100, col="red", expression(bold(This)~underline(is)~a~italic(test.)))
dev.off()

pdf("Timesz.pdf", family="Times")
hist(z, main="Histogram of -- Standard Z", xlim=c(-5, 5))
text(x=-3, y=100, col="red", expression(bold(This)~underline(is)~a~italic(test.)))
dev.off()

pdf("Helveticaz.pdf", family="Helvetica")
hist(z, main="Histogram of -- Standard Z", xlim=c(-5, 5))
text(x=-3, y=100, col="red", expression(bold(This)~underline(is)~a~italic(test.)))
dev.off()

pdf("ComicSans.pdf", family="Comic Sans MS")
hist(z, main="Histogram of -- Standard Z", xlim=c(-5, 5))
text(x=-3, y=100, col="red", expression(bold(This)~underline(is)~a~italic(test.)))
dev.off()

pdf("Georgia.pdf", family="Georgia")
hist(z, main="Histogram of -- Standard Z", xlim=c(-5, 5))
text(x=-3, y=100, col="red", expression(bold(This)~underline(is)~a~italic(test.)))
dev.off()

pdf("Garamond.pdf", family="Garamond")
hist(z, main="Histogram of -- Standard Z", xlim=c(-5, 5))
text(x=-3, y=100, col="red", expression(bold(This)~underline(is)~a~italic(test.)))
dev.off()


Sys.setenv(R_GSCMD = "C:/Program Files/gs/gs9.05/bin/gswin32c.exe")


embed_fonts('Arialz.pdf', outfile='Arialz-embed.pdf')
embed_fonts('Timesz.pdf', outfile='Timesz-embed.pdf')
embed_fonts('Helveticaz.pdf', outfile='Helveticaz-embed.pdf')
embed_fonts('ComicSans.pdf', outfile='ComicSans-embed.pdf')
embed_fonts('Georgia.pdf', outfile='Georgia-embed.pdf')
embed_fonts('Garamond.pdf', outfile='Garamond-embed.pdf')






pdf("CMz.pdf", family="CM Roman")
hist(z, main="Histogram of -- Standard Z", xlim=c(-5, 5))
text(x=-3, y=100, col="red", expression(bold(This)~underline(is)~a~italic(test.)))
dev.off()
embed_fonts('CMz.pdf', outfile='CMz-embed.pdf')
