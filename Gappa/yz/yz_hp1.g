# Latitude encoding function

@rnd = float<ieee_64,ne>;
@floor = int<dn>;

n = floor(n_); # n is an integer
i = floor(i_); # i is an integer

dlr       = 60 - i;
dlf   rnd = 60 - i;
tmp1r     = (n * dlr + 0x1.0p+14)*0x1.0p-15;
tmp1f rnd = (n * dlf + 0x1.0p+14)*0x1.0p-15;  
tmp2r     = (n * dlr)*0x1.0p-32;
tmp2f rnd = (n * dlf)*0x1.0p-32;
yzr1       = floor(tmp1r) - 0x1.0p+17 * floor(tmp2r) ;
yzf1   rnd = floor(tmp1f) - 0x1.0p+17 * floor(tmp2f) ;

## Hypothesis 1
{ (i in [0,1] /\ n in [0,4294967296] -> 
   (
   tmp1f - tmp1r in [0,0]
   /\
   tmp2f - tmp2r in [0,0]
   /\
   ((floor(tmp1f) - floor(tmp1r) in [0,0] /\ floor(tmp2f) - floor(tmp2r) in [0,0]) -> yzf1 - yzr1 in [0,0])
   ))
}

# complete the coq certificate with the proof of
# forall x,y: x = y -> floor(x) = floor(y) 

