### Rock paper scissors function

rps <- function(move){
  options <- c("rock","paper","scissors")
  comp.move <- sample(options,size <- 1)
  if(move == "rock" & comp.move == "rock"){

    names(comp.move) <- "tie"
    
  } else if(move == "rock" & comp.move == "scissors"){
      
      names(comp.move) <- "I lose, You win"
      
    } else if(move == "rock" & comp.move == "paper"){
        
        names(comp.move) <- "I win, you lose"
        
      } else if(move == "paper" & comp.move == "paper"){
          
          names(comp.move) <- "tie"
          
        } else if(move == "paper" & comp.move == "scissors"){
            
            names(comp.move) <- "I win, You lose"
            
          } else if(move == "paper" & comp.move == "rock"){
              
              names(comp.move) <- "I lose, You win"
              
            } else if(move == "scissors" & comp.move == "scissors"){
                
                names(comp.move) <- "tie"
                
              } else if(move == "scissors" & comp.move == "rock"){
                  
                  names(comp.move) <- "win"
                  
                } else if(move == "scissors" & comp.move == "paper"){
                    
                    names(comp.move) <- "loss"
                  }
  return(comp.move)
}
