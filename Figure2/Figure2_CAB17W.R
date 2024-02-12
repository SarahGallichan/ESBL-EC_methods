##########################
####  Figure 2 CAB17W ####
##########################

##Load packages

library(tidyverse)
library(here)

##Import dataset

Spike_CAB17W <- read.csv(here("Figure2/Figure2_CAB17W.csv"))

##Clean data names

Spike_CAB17W <- janitor::clean_names(Spike_CAB17W)

##Plot data

Spike_CAB17W_plot <- Spike_CAB17W %>% 
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

Spike_CAB17W_plot

##Save plot

ggsave(here("Figure2_CAB17W.pdf"), plot = Spike_CAB17W_plot, device = "pdf", scale =1, width = 20, height = 25, units = "cm", dpi = 300)