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
