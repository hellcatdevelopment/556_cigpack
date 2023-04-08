Config = {}

Config.pipeitem =                           "pipe"
Config.PackContains =                       10
Config.LooseEachUse =                       1


Config.items = {

--                                          metadata only enabled if pack = true, if using a single cigarette do pack = false
--                                          types:  cigarette    
--                                                  cigar   
--                                                  joint    
--                                                  pipe
--                                          highduration: in seconds, after every pull so better not go over 10

["cigpack"] = {         
    type =                                  "cigarette",
    pack =                                  true,
    pipe =                                  false,
    high =                                  false,
    hightype =                              "PlayerDrugsHalluc01",
    highduration =                          5,
},

["oldpanamas"] = {         
    type =                                  "cigarette",
    pack =                                  true,
    pipe =                                  false,
    high =                                  true,
    hightype =                              "PlayerDrugsHalluc01",
    highduration =                          5,
},

["cigarpack"] = {           
    type =                                  "cigar",
    pack =                                  true,
    pipe =                                  false,
    high =                                  false,
    hightype =                              "PlayerDrugsHalluc01",
    highduration =                          5,
},

["jointpack"] = {           
    type =                                  "joint",
    pack =                                  true,
    pipe =                                  false,
    high =                                  true,
    hightype =                              "l_0034b485up",
    highduration =                          5,
},

["tobaccodings"] = {          
    type =                                  "pipe",
    pack =                                  false,
    pipe =                                  true,
    high =                                  false,
    hightype =                              "PlayerDrugsHalluc01",
    highduration =                          5,
},

["rauchopium"] = {          
    type =                                  "pipe",
    pack =                                  false,
    pipe =                                  true,
    high =                                  true,
    hightype =                              "l_001bfa4fss",
    highduration =                          10,
},

["backwood"] = {          
    type =                                  "cigarette",
    pack =                                  false,
    pipe =                                  false,
    high =                                  true,
    hightype =                              "l_001bfa4fss",
    highduration =                          10,
},

["joint"] = {          
    type =                                  "cigarette",
    pack =                                  false,
    pipe =                                  false,
    high =                                  true,
    hightype =                              "l_0034b485up",
    highduration =                          10,
},

["cigarette"] = {          
    type =                                  "cigarette",
    pack =                                  false,
    pipe =                                  false,
    high =                                  false,
    hightype =                              "PlayerDrugsHalluc01",
    highduration =                          10,
},

}

Config.Texts = {
        Cigarette =                         "Zigarette",
        Cigar =                             "Zigarre",
        Joint =                             "Joint",
        Pipe =                              "Pfeife",
        Smoke =                             "Ziehen",
        PutOut =                            "Ausmachen",
        Durability =                        "Beinhaltet: ",
        NeedPipe =                          "Du brauchst eine Pfeife"
}