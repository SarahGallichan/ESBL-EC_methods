#############
## Figure 3##
#############

##Import dataset
Qubit_yield <- read.csv(here("Figure3/Figure3_Qubit_yield.csv"))

##Clean data
Qubit_yield <- janitor::clean_names(Qubit_yield) 

##Plot data
Qubit_yield_plot <- Qubit.yield %>% ggplot(aes(extraction_kit,dna_yield)) + 
  geom_jitter(shape=16, position=position_jitter(0.2)) +
  geom_boxplot(alpha = 0.5, notch = FALSE) + 
  labs(x = "Extraction Kit", y = "DNA yield (ng/uL)") + 
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1), text = element_text(size=13))

Qubit_yield_plot

##Save plot
ggsave(here("Figure3"), plot = Qubit_yield_plot, device = "pdf", scale =1, width = 20, height = 25, units = "cm", dpi = 300)