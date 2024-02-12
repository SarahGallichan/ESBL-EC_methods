#############################
####  Figure 2 NCTC13441 ####
#############################

##Load packages

library(tidyverse)
library(here)

##Import dataset

Spike_NCTC13441 <- read.csv(here("Figure2/Figure2_NCTC13441.csv"))

##Clean data names

Spike_NCTC13441 <- janitor::clean_names(Spike_NCTC13441)

##Plot data

Spike_NCTC13441_plot <- Spike_NCTC13441 %>% 
  ggplot(aes(broth, log_cfu, col= broth)) +
  scale_color_manual(values=c('forestgreen','purple'))+
  geom_point(aes(broth, average_lb, col= broth), shape = 3, size = 4)+
  ylim(6, 11) +
  theme_bw()+
  geom_jitter(shape=16, size=2, position=position_jitter(0.25)) +
  facet_grid (antibiotic ~ incubation_time) + 
  labs(x= "Broth", y = "log(CFU/mL)") +
  guides(col=guide_legend(title="Broth")) +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1), text = element_text(size=18))

Spike_NCTC13441_plot

##Save plot

ggsave(here("Figure2_NCTC13441.pdf"), plot = Spike_NCTC13441_plot, device = "pdf", scale =1, width = 20, height = 25, units = "cm", dpi = 300)
