# WASH Benefits Data

The data come from a study of the effect of water quality, sanitation, hand
washing, and nutritional interventions on child development in rural Bangladesh
(WASH Benefits Bangladesh): a cluster-randomised controlled trial. The study enrolled pregnant 
women in their first or second
trimester from the rural villages of Gazipur, Kishoreganj, Mymensingh, and
Tangail districts of central Bangladesh, with an average of eight women per
cluster. Groups of eight geographically adjacent clusters were block-randomised,
using a random number generator, into six intervention groups (all of which
received weekly visits from a community health promoter for the first 6 months
and every 2 weeks for the next 18 months) and a double-sized control group (no
intervention or health promoter visit). The six intervention groups were:

1. chlorinated drinking water;
2. improved sanitation;
3. handwashing with soap;
4. combined water, sanitation, and hand washing;
5. improved nutrition through counseling and provision of lipid-based nutrient
   supplements; and
6. combined water, sanitation, handwashing, and nutrition.

In this data extract, we concentrate on child growth (size for age) as the outcome of
interest. For reference, this trial was registered with ClinicalTrials.gov as
NCT01590095.

For the purposes of illustration, we will treat these data as
independent and identically distributed (i.i.d.) random draws from a very large
target population. We could, with available options, account for the clustering
of the data (within sampled geographic units), but, for simplification, we avoid
these details in these workshop presentations, although modifications of our
methodology for biased samples, repeated measures, etc., are available.

We have 28 variables measured, of which 1 variable is set to be the outcome of
interest. This outcome, $Y$, is the weight-for-height Z-score (`whz` in `dat`);
the treatment of interest, $A$, is the randomized treatment group (`tr` in
`dat`); and the adjustment set, $W$, consists simply of *everything else*. This
results in our observed data structure being $n$ i.i.d. copies of $O_i = (W_i,
A_i, Y_i)$, for $i = 1, \ldots, n$.

# Provenance

Raw data were sourced from the OSF page for the WASH Benefits trial: [https://osf.io/wvyn4/], and the example dataset was generated with the `make_washb.sh` script in the scripts subdirectory.

# Acknowledgments

We thank the WASH Benefits investigators for graciously allowing us to use their data as an example. The trial was funded by the Bill & Melinda Gates Foundation through a grant to the University of California, Berkeley (OPPGD759). 