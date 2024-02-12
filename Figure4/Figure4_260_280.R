#####################
## Figure 4 260_280##
#####################

##Import dataset
Qubit_260_280 <- read.csv(here("Figure4/Figure4_260_280.csv"))

##Clean data
Qubit_260_280 <- janitor::clean_names(Qubit_260_280) 

##Plot data
plot260.280 <-Nanodrop.260.280 %>% ggplot(aes(extraction_method, x260_280)) + 
  geom_rect(aes(xmin=-Inf,xmax=Inf,ymin=1.8,ymax=2.1),fill="grey", alpha = 0.3) + 
  geom_boxplot(alpha = 0.5, notch = FALSE, outlier.shape = NA)+ 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(x= "Extraction Kit", y = "260/280 ratio")+ 
  theme_bw()+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1), text = element_text(size=13))

plot260.280

##Save plot
ggsave(here("Figure4_260_280"), plot = plot260.280, device = "pdf", scale =1, width = 20, height = 25, units = "cm", dpi = 300)