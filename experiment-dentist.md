Experiment 4: Visiting the Dentist
----------------------------------

The gut biome is interesting enough, but bacteria colonize just about every part of the body, so here’s an experiment to measure the mouth bacteria and how the varieties shift after a visit to the dentist.

The mouth harbors its own unique ecology of bacteria, much of which is entirely unexplored. Scientists from the Forsyth Institute in Boston are at the cutting edge of the research, and have characterized many of the species found in their test subjects mouths, but widespread human trials are still years from producing the kinds of results we see from the gut biome research.

So far the research *is* clear that cavities are almost always caused by one nasty species: *Streptococcus Mutans*. This bug contains receptors that adhere to the surface of the tooth, creating a slimy biofilm where, under the right conditions it can breed rapidly. Interestingly, just a few hundred bacterial cells is enough for it to begin its work, feeding on glucose to create a reaction that combines with the tool enamel to form plaque. The ever-present lactic acid in the mouth, a critical component of pre-digestion, reacts with the plaque to remove calcium from the tooth, leaving small, ever deepening holes that will destroy the tooth unless the dentist intervenes will a filling.

\[Author Note: the examples in this section are written in R, but should be modified to work with Python -- and made compatible with PowerBiome \]

So my first test will be to see if I have any S. Mutans:

    afterMouth[grepl("Streptococcus",afterMouth$tax_name),]$tax_name

    ## [1] Streptococcus                      Streptococcus pseudopneumoniae    
    ## [3] Streptococcus sanguinis            Streptococcus constellatus        
    ## [5] Streptococcus anginosus group      Streptococcus sp. oral clone GM006
    ## [7] Streptococcus thermophilus         Streptococcus oralis              
    ## [9] Streptococcus gordonii            
    ## 250 Levels: [Eubacterium] sulci ... Veillonellaceae

Answer: no. And sure enough, my dentist confirms that I have no cavities.

Now let’s see how my mouth biome changed as a result of the visit:

First I load my uBiome data into two variables, one for each sample: (`before``Mouth`) and the other from (`after``Mouth`), after a visit to my dentist. Let’s look at the species that disappeared (went extinct) between the two samples:

    extinct <- uBiome_sample_unique(beforeMouth,afterMouth)

    ##   count                        missing.tax_name
    ## 1  6034                Capnocytophaga granulosa
    ## 2  4153 Peptostreptococcus sp. oral clone FL008
    ## 3  3375         Prevotella sp. oral clone ID019
    ## 4  2691                   Streptococcus rubneri
    ## 5  1571                       Prevotella buccae

Anything in the genus [*Capnocytophaga*] is an opportunistic pathogen, so I say good riddance. Usually they’re fine, but if your immune system dips they can turn bad.

[Streptococcus rubneri] was discovered a couple years ago, so little is known about it.

[Prevotella buccae] is more interesting. It seems to be implicated in periodontal disease but that genus is involved too in breaking down proteins and carbohydrates, so it’s difficult to know for sure whether it’s “good” or “bad” in this case. Still, it’s something to watch for my next test.

Let’s see which species are new after leaving the dentist’s chair:

    Change <- uBiome_sample_unique(afterMouth,beforeMouth)

    ##   count                        missing.tax_name
    ## 1  3640                  bacterium NLAE-zl-P562
    ## 2  2725                 Streptococcus sanguinis
    ## 3  2075               Capnocytophaga gingivalis
    ## 4  1969 Peptostreptococcus sp. oral clone FG014
    ## 5  1618                 Granulicatella adiacens

One of those species, *Streptococcus sanguinis* looks interesting. [Wikipedia] says this:

> *S. sanguinis* is a normal inhabitant of the healthy human mouth where it is particularly found in dental plaque, where it modifies the environment to make it less hospitable for other strains of Streptococcus that cause cavities, such as Streptococcus mutans.

Perhaps that’s the reason for my no cavities? If I picked up a strain of bacteria that can outcompete the ones that cause cavities, that would be great news and something I’ll want to nurture in the future.

Finally, let’s look at overall numbers. Which species underwent the biggest changes (increase) since the first sample:

    compare <- uBiome_compare_samples(beforeMouth,afterMouth)

    ##                                  tax_name count_change
    ## 64         Streptococcus pseudopneumoniae        62007
    ## 68         Veillonella sp. oral taxon 780         8065
    ## 41                       Neisseria oralis         4693
    ## 2  Abiotrophia sp. oral clone P4PA_155 P1         2308
    ## 28                 Granulicatella elegans         1987

Whoah! That first one, *Streptococcus pseudopneumoniae*, looks nasty! [Wikipedia][9] says it may cause pneumonia, though a recent medical journal says more hopefully that it [“treads the fine line between commensal and pathogen”]

which is a scientific gobbleygook way of saying nobody has a clue. All the more reason to keep testing, submitting, and getting more data.

Keeping S. Mutans at bay is an important way that I’ll try to avoid cavities, so to continue the experiment, I’ll look at what I can do to manipulate the mouth biome, beyond what I eat and drink. A key part of that is how I brush my teeth.

Like most Americans, for years I brushed exclusively with one of the name brand toothpastes, usually Crest or Colgate. But looking more closely at the labels, I see two ingredients that will be of interest to my oral microbiome: triclosan and sodium lauryl sulfate, both of which are powerful anti-microbials. In addition, the fluoride in the paste works partly by making the tooth enamel more difficult for bacteria.

Pre-modern humans didn’t have toothpaste, and certainly not the antimicrobial kinds that have become popular only in the past generation. Of course, tooth decay was a painful reality for many of our ancestors as well, but there is good evidence that serious teeth problems didn’t begin until the widespread availability of sugar after the European immigration to America five hundred years ago. Skulls of humans before agriculture show almost no tooth decay. Wild animals, including primates like gorillas and chimpanzees get far fewer tooth problems than modern people, another clue that teeth brushing isn’t the whole story.

Could it be that a healthy mouth requires a healthy *diversity* of bacteria, including ones like the S. Sanguinis that out-competes the cavity-causing kinds? But toothpaste with triclosan and other anti-microbials are wide-spectrum: they don’t target just the “bad” cavity-causing organisms. They also kill other species needed for digestion, or to control bad breath.

To find out more about whether oral diversity is a good or bad thing, for my continuing mouth experiment I changed toothpaste. Rather than continue with one of the leading fluoride brands, I switched to a more “natural” brand whose ingredient list does *not* contain antimicrobials.

\[Author’s note: I’ll have the results of this experiment by November 2015 and describe that in the rest of this chapter\]
