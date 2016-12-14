v <- read.table(file("stdin"))
t <- data.frame(prog=v[,1], funcs=(v[,2]=="func"), time=v[,3], mem=v[,4])

library(ggplot2)
p <- ggplot(data=t, aes(x=prog, y=time, fill=prog))
p <- p + geom_bar(stat = "identity")
p <- p + facet_wrap(~ funcs)
p <- p + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
p <- p + ylab("time (s)") + ggtitle("Runtime for benchmark variants")
ggsave('time.png',plot=p,width=10,height=6)

p <- ggplot(data=t, aes(x=prog, y=mem, fill=prog))
p <- p + geom_bar(stat = "identity")
p <- p + facet_wrap(~ funcs)
p <- p + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
p <- p + ylab("memory (B)") + ggtitle("Memory use for benchmark variants")
ggsave('memory.png',plot=p,width=10,height=6)