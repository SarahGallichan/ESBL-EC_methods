#####################
## Figure 4 260_230##
#####################

##Import dataset
Qubit_260_230 <- read.csv(here("Figure4/Figure4_260_230.csv"))

##Clean data
Qubit_260_230 <- janitor::clean_names(Quality_and_quantity_of_kit_comparison)

##Plot data
plot260_230 <- Qubit_260_230 %>% ggplot(aes(extraction_method, x260_230)) + 
  geom_rect(aes(xmin=-Inf,xmax=Inf,ymin=2.0,ymax=3.0),fill="grey", alpha = 0.3) + 
  geom_jitter(position=position_jitter(0.2)) + 
  geom_boxplot(alpha = 0.5, notch = FALSE, outlier.shape = NA)+
  labs(x= "Extraction Kit", y = "260/230 ratio")+ 
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1), text = element_text(size=13))

plot260_230 

##Save plot
ggsave(here("Figure4_260_230"), plot = plot260_230, device = "pdf", scale =1, width = 20, height = 25, units = "cm", dpi = 300)