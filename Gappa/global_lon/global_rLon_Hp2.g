# Longitude Global Decoding (NL>1)

@rnd = float<ieee_64,ne>;
@floor = int<dn>;

i = floor(i_);     # integer
xz0 = floor(xz0_); # integer
xz1 = floor(xz1_); # integer
nl = floor(nl_);   # integer

dLonr      = 360 / (nl - i);
dLonf rnd  = 360 / (nl - i);

m1r     = ((nl - 1) * xz0 - nl * xz1 + 0x1.0p+16)*0x1.0p-17;
m1f rnd = ((nl - 1) * xz0 - nl * xz1 + 0x1.0p+16)*0x1.0p-17;
mr      = floor(m1r);
mf  rnd = floor(m1f);

# Main property
{ (i in [0,1] /\ nl in [2,59] /\ xz0 in [0,131071] /\ xz1 in [0,131071] -> 
  (m1f - m1r in [0,0]
  /\
  (floor(m1f) - floor(m1r) in [0,0] -> mf - mr in [-0.000046,0.000046])))}

# complete the coq certificate with the proof of
# forall x,y: x = y -> floor(x) = floor(y) 
