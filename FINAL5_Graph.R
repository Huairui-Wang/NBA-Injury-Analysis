
data <- read.csv("merged_data_all.csv")
data$OffensiveStyle <- data$PTS_PrGs + data$AST_PrGs + 0.5 * data$ORB_PrGs
data$DefensiveStyle <- data$STL_PrGs + data$BLK_PrGs + data$DRB_PrGs
# Work load
data$Workload <- data$MP_PrGs * data$G
# Tow or three shots choice
data$TwoPointRate <- data$X2PA_PrGs / data$FGA_PrGs
data$ThreePointRate <- data$X3PA_PrGs / data$FGA_PrGs
# Efficiency
data$ShootingEfficiency <- data$eFG._PrGs
data$LoadPerGame <- data$MP_PrGs
data$EfficiencyPerAge <- data$ShootingEfficiency / data$age_at_injury

# behavior
data$DefensiveAggressiveness <- data$STL_PrGs + data$BLK_PrGs
data$TurnoverRate <- data$TOV_PrGs / data$MP_PrGs
data$FoulRate <- data$PF_PrGs / data$MP_PrGs

data_cor_matrix <- data %>% 
  select(age_at_injury, height_cm, weight_kg, career_before, 
         OffensiveStyle, DefensiveStyle,
         Workload,
         TwoPointRate, ThreePointRate,
         ShootingEfficiency, LoadPerGame, EfficiencyPerAge,
         DefensiveAggressiveness, TurnoverRate, FoulRate
  )
cor_matrix <- cor(data_cor_matrix, use = "pairwise.complete.obs")

corrplot(cor_matrix, 
         method = "color", 
         type = "upper", 
         tl.col = "black",  
         tl.srt = 45,        
         tl.cex = 0.5,       
         addCoef.col = "black",       
         number.cex = 0.6, 
)

```
