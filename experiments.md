Experimenting with Multiple Sample Results
==========================================

Microbe numbers shift daily in response to your environment, so a single sample won’t give much more than a broad introduction to the basics of your microbiome. To understand the results of a given test, you’ll soon want to compare it to other samples, either from yourself at a different point in time, or to other people. This chapter will give examples for how to do that.

Experiment 1: How does food affect my microbiome
------------------------------------------------

Let’s start with a simple example involving food. These experiments are the easiest and often the most insightful because food intake is so easy to manipulate: you either eat the specific item you’re testing or you don’t. Also, this is the type of comparative diet that nutrition scientists conduct all the time, and often you can compare your results and methods to experiments that have already been performed. You could test how your gut responds to a particular type of food, like gluten or alcohol, or you can test different diets: vegetarian vs. omnivore, conventional versus organic, artificial sweeteners versus ordinary sugar. One big advantage of testing on yourself is that, rather than hope to extrapolate from a study done on other people, you’ll know how these diets affect *you*.

A good experiment should reduce or eliminate as many external variables as possible. Ideally, if I were testing gluten for example, I would pick a time period when everything about my life is identical except for the gluten I eat. Unfortunately, few of us have lives where we can be so precise about what’s changed and what hasn't. For that reason, the purpose of my first experiment is simply to establish a baseline. I’ll eat my “normal” diet, with no particular intervention one way or another. This will give me a rough idea of the background noise that I can compare with results from future experiments.

Since the purpose of my test is to measure the effect of diet, I’ll carefully track not only everything I eat during this period, but what I ate for the week or two beforehand as well.

To track food, I use the (free) app MyFitnessPal <http://myfitnesspal.com> , on my iPhone (versions are available for Android and web too). There are many other, similar apps, but I like MyFitnessPal because it has by far the largest food database. Its massively crowd-sourced data includes bar code scan information for just about any packaged food product, so most of the time I simply point the phone at an ingredients label and it automatically computes all the nutritional information. Importantly, I can then export all my detailed nutritional information to a CSV file or spreadsheet for later analysis.

I chose to do my tests from Sunday to Sunday, carefully tracking several weeks of nutritional data before, during, and after. After submitting my samples by mail, it takes about 6 weeks to get results. At that point, just log into the uBiome web site and download your raw information. Here’s how:

First, click the “Download taxonomy” button on [the web page for your sample].


Although it will look like gobbley-gook, you can turn this into an Excel spreadsheet easily enough following the techniques in the chapter “Analyze your microbiome in Excel”. At that point, you’ll have a spreadsheet with three columns: “count\_norm”, “tax\_rank” and “tax\_name”:

![][1]

Then it’s a simple matter of running some standard Excel filtering operations on the fields, as explained in the previous chapter. Filter tax\_rank by “Phylum” and then sort the count\_norm field from largest to smallest. The count\_norm numbers correspond to parts per million – just divide by 10,000 to get the percentages.

By the way, a big bonus awaits you in the taxonomy file that you can’t get from the standard web page: species information. [Most scientists trust] the 16S rRNA technology down to the genus level, but there is more uncertainty at the species level, so uBiome doesn’t publish it to the web page. Drag it into Excel, though, and you can make up your own mind about whether you trust the species info or not.

Next go to [the Github page for this book] and download ubiome.py. If you have the Python language on your computer (all Macs come with it built-in), you can run this file without installing anything extra. See the appendix for a quick summary of what you’ll need to know to get started.

In my case, I have two samples that I’ve downloaded to my computer. The first, before.JSON is the taxonomic information from the start of my experiment. The file from the sample taken one week later is called after.JSON. Let’s see what changed during the week.

On a Mac, open Terminal and run the following command:

    python ubiome.py –u before.JSON after.JSON &gt; extinct.CSV

The –u switch tells the script to identify from the two samples only those organisms that are unique to the first sample. The new file, extinct.CSV contains just those organisms, i.e. the ones from the sample before, but not in the later one. In other words, these are the organisms that went extinct during the week-long trial.

Similarly, the following command will give you a file that contains the relative differences between every organism in before and after.

    python ubiome.py –c before.JSON after.JSON &gt; diffs.CSV

This time, the –c switch tells the script to compare the two samples and return the differences between them. Opening the file diff.csv, I find this:

![][2]

Negative numbers indicate a drop from the first sample; positive numbers mean the amounts increased at the second test. In this case, I’m seeing a large drop in the phylum Firmicutes at the end of the week, with a small increase in Bacteroidetes.

Incidentally, these differences would normally sum to zero, but in this case they clearly don’t. Why not? The reason is that the later sample has an increase in unidentified organisms, adding up to about 8% of the entire sample – accounting for the difference. It’s not uncommon for the 16S analysis to be unable to identify 5-10% or more of a sample. So much about the microbiome is still unexplored, and this is one example.

Here’s another look, this time at the species level:

![][3]

In this example, I see a large increase in ***Faecalibacterium prausnitzii***, often considered a marker for health (see the discussion in the section “Organisms to Watch”). I’ll want to look at my meals over the test period to see what might have driven this positive change.

Using the macronutrient data I collected daily with MyFitnessPal (exported to CSV with the handy exporter at <https://www.designbyvh.com/myfitnesspal-export-data/>) I produced this simple chart to see if my eating habits had an effect on my microbiome:

![][4]

As you can see, though I apparently ate about 20% more overall during the week of my test, my dietary cholesterol was conspicuously lower than normal. Did this affect my microbiome?

To find out, I searched the medical and biology literature to see if there are known relationships between dietary cholesterol and *Faecalibacterium*. A simple Pubnet search for that taxa and “cholesterol” brings several hits, including one from a paper published in BMC Genomics[^1], about patients with cholesterol gallstones. Note this key result from the summary:

* there were significant (P &lt; 0.001) increases of gut bacterial phylum Proteobacteria and decreases of three gut bacterial genera ,Faecalibacterium, Lachnospira, and Roseburia. *

I’m not a doctor, nor do I pretend that this has any medical consequences, but when I look at my own changes for the week, I see the following genera:

![][5]

Is it a coincidence that the very specific bacterial genera that are mentioned in a paper linking cholesterol to the gut biome *are the same ones that changed* in a week in which I ate less dietary cholesterol than normal? Did I find something new? That’s the exciting part about this type of citizen science: armed with my own data and imagination, new discoveries are everywhere.

Experiment 2: Traveling through the jungle
------------------------------------------

In the previous chapter we discussed the Lawrence David study that measured an individual microbiome daily for a year and found a dramatic change when one of the subjects moved temporarily to Thailand. I recently did something similar for a family vacation in Central America. Would the same changes happen to me?

We spent most of our time in a rural, jungle part of Belize, about a half hour’s drive from Benque, near the border with Guatemala. Besides viewing the fantastic, well-preserved Mayan ruins, we also did horseback riding, cave exploration, and of course plenty of eating.

I did one other thing: before leaving on the trip, and immediately afterwards, I took some gut microbiome samples. Here’s what my gut microbiome (phylum level) looked like before and after the trip:

  **Phylum**            **Before**   **After**
  --------------------- ------------ -----------
  **Firmicutes**        71.836%      67.930%
  **Bacteroidetes**     16.424%      14.900%
  **Actinobacteria**    7.616%       0.771%
  **Proteobacteria**    0.982%       7.514%
  **Verrucomicrobia**   0.664%       0.013%
  **Tenericutes**       0.065%       0.071%

As we discussed in previous chapters, the phylum level is the “big picture”, and the first place to look at a new sample. In my case, the two biggest groupings didn’t change much: my ratio of Firmicutes to Bacteroidetes changed hardly at all, despite the different eating and living conditions. Apparently those two microbes quickly adjusted.

The most unusual change during my trip was the increase in *Proteobacteria*, from less than 1% to almost 8%. Even more interesting was that the Lawrence David study found the same thing: a westerner traveling to a developing country sees a sharp rise in *Proteobacteria*!

To see how or why this happened, I’ll review my samples at a lower taxonomic level. Here are the organisms found at the genus level:

  Genus                **Before**   **After**
  -------------------- ------------ -----------
  Faecalibacterium     14.198%      20.374%
  Bacteroides          12.717%      10.396%
  Blautia              4.469%       8.585%
  Ruminococcus         8.383%       7.906%
  Pseudobutyrivibrio   1.804%       4.134%
  Cronobacter          0.002%       3.592%
  Coprococcus          5.411%       2.574%
  Clostridium          6.611%       1.763%
  Parabacteroides      0.507%       1.393%

Most of the new organisms I picked up come from the family [***Enterobacteriales***], of which the majority – about 3.5% of my entire sample – is [***Cronobacter***], a nasty pathogen named after the [**Greek mythological titan**] who swallowed his children!

Ouch! Fortunately I never got sick. Why not? The science is just too new to say for sure, but here’s my theory: there is [**no such thing as “good” or “bad” bacteria**]. Everything depends on the *ratios*, on *balance* among lots of competing germs. In my case – and this is my pure, amateur, unscientific speculation – the *Cronobacteria* increase might actually have *helped* my health, by out-eating something else that may have been even worse.

Here are some reasons I suspect this is true:

-   **Diversity**: Oddly, my gut biome diversity went *down* slightly. Before the trip, uBiome found 19 unique phyla. Afterwards, there were only 15. You wouldn’t normally expect diversity to *drop* after exposure to novel microbes from the jungle. But I think there’s an easy explanation:

-   **Increase in unidentified organisms**: uBiome was able to identify only about 91% of what it found at the phyla level. In my previous tests, they found closer to 95+%. Maybe my apparent drop in diversity was simply a drop in *identifiable* bacteria. Maybe some of those unknown organisms stimulated the bloom in *Cronobacter*.

-   **Clostridium plunge**: I saw huge drops, from 0.66% to 0.18%, in the notorius *Clostridum*genus, which includes many nasty species (e.g. the infamous antibiotic-resistant *C. Difficile*). Other pathogens dropped too. Did the change in location precipitate a fight between competing bacterial armies?

-   **Parasites**: the uBiome test only measures bacteria, so I don’t know the status of other microbes I encountered. If *Cronobacteria* are normally pathogenic, is it possible that all their toxicity was aimed at a takeover by some other organism?

The Lawrence David study also showed that the microbiome bounced back to normal again pretty quickly after the person returned back home. Is the same true for me? That’s something to watch for in my next samples.

Experiment 3: Hacking my sleep
==============================

Measuring before and after a change is a nice way to see how my microbiome adjusts to circumstances, but what happens if I try to manipulate the microbiome to achieve a specific result? This experiment will try to do exactly that.

Martin Blaser’s excellent book about the microbiome, *Missing Microbes*, mentions that most (80%) of the precursors to the sleep- and mood-regulating neurotransmitter serotonin [are made in the gut]. Could my gut microbes affect my sleep?

A quick internet search for “gut microbe serotonin” will lead you to  [B. infantis, which modulates tryptophan], the stuff in turkey that urban legends have long blamed for [that sleepy feeling] you get after Thanksgiving dinner. This seems like a good target to check, so my first step was to look at my gut biome results to see my levels of the *B. infantis* parent genus *bifidobacterium*.

![][6]

How do I tell whether 0.85% is a “normal” or not? uBiome offers this view to compare yourself to the others in their database:

![][7]

Looks like I’m much lower than average. A search through the rest of the sheet shows that I have no measured amount of *B. infantis*. The 16S testing for a specific species can be unreliable, so I won’t take that as a definitive no, but it clearly leaves some room for improvement.

How can I improve my overall *Bifidobacterium* levels? It helps to understand something about the bacterium itself, at all its levels. Fortunately, it’s a well-studied organism, first identified back in 1899 as a common inhabitant of the intestines of breast-fed infants. Nowadays you can buy prebiotics that contain lots of bifido – or so they claim. Without rigorous lab independent verification of the claims, it can be hard to tell if the prebiotic form is helpful or not. (In fact, that may be a good experiment)

Bifido is highly sensitive to oxygen, and flourishes best in environments like the colon that are anaerobic. It’s also a strong fermenter of certain types of starches, called resistant starch, so-called because they resist digestion.

One of the best resistant starches is plain old potato starch, made by finely grinding tubers into a light, white powder. You can buy an organic version from *Bob’s Red Mill* at most natural foods stores or high-end supermarkets. It’s cheap, and tasteless, so it’s often used in cooking, as a thickener for sauces.

The nutrition label on potato starch shows that it is essentially inert as a food. No calories, vitamins, or minerals, no fat, and not even any fiber. It’s just zero on everything, because it passes right through the stomach. When cooked, it becomes a thick, gooey consistency that quickly is absorbed by powerful stomach acids, but if kept in its raw state, it slides right through into the colon.

Not many other foods make it this far undigested, so a rich unfermented wad of fresh potato starch is a real treat for the Bifido of the colon and they quickly begin to make the most of it, fermenting it into the precursors to tryptophan.

For this experiment I started with two tablespoons the first day, and then three tablespoons the next. Anything larger might risk unpleasant gas or loose stools until my body adjusts. Within two days, though, it was obvious that something was working. I couldn’t believe my excellent sleep that first couple of nights.

After a few days, the sleep effect started to wear off, though I still felt much-improved. But could I trace the improvement to improved levels of Bifido? To find out, I measured myself again:

![][8]

Bifidobacterium is *much* higher! I raised my bifido levels by almost 7 times.

The other genera changed as well, but among the top taxa, the Bifido change was clearly the most significant. For more proof, look at this chart showing all the samples I took before and after my potato starch experiments.

Clearly, something significant changed when I added potato starch to my diet.

Experiment 4: Visiting the Dentist
----------------------------------

The gut biome is interesting enough, but bacteria colonize just about every part of the body, so here’s an experiment to measure the mouth bacteria and how the varieties shift after a visit to the dentist.

The mouth harbors its own unique ecology of bacteria, much of which is entirely unexplored. Scientists from the Forsyth Institute in Boston are at the cutting edge of the research, and have characterized many of the species found in their test subjects mouths, but widespread human trials are still years from producing the kinds of results we see from the gut biome research.

So far the research *is* clear that cavities are almost always caused by one nasty species: *Streptococcus Mutans*. This bug contains receptors that adhere to the surface of the tooth, creating a slimy biofilm where, under the right conditions it can breed rapidly. Interestingly, just a few hundred bacterial cells is enough for it to begin its work, feeding on glucose to create a reaction that combines with the tool enamel to form plaque. The ever-present lactic acid in the mouth, a critical component of pre-digestion, reacts with the plaque to remove calcium from the tooth, leaving small, ever deepening holes that will destroy the tooth unless the dentist intervenes will a filling.

\[Author Note: the examples in this section are written in R, but should be modified to work with Python. \]

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

Caveats
-------

It’s also worth asking whether these results are meaningful enough to be worthy of further analysis. How representative were these samples of my microbiome at the time? I submit only a tiny swab to uBiome’s lab; are the bacteria distributed evenly enough that the size or location of the sample doesn’t matter? Would I get similar results if I submitted two tests from slightly different sites on the same sample?

The answers to all these questions are unclear, but while we need to take these concerns seriously, my experience over many samples is that the uBiome results are consistent enough that, yes, the conclusions are actionable as long as we keep the limitations in mind. Here’s why I think so:

First, my results are consistent with other “healthy omnivore” submissions that uBiome has received from others with diets and health histories similar to mine. I would be concerned if, for example, my firmicutes/bacteroidetes ratio were reversed.

Second, 16S technology has proven accuracy when identifying unique organisms, so I can generally trust information about the overall level of diversity regardless of specific proportions. Since diversity tends to correlate with health – and is manipulable based on what I eat – my own experience shows that the changes I see in these results go up and down consistently in the expected way. Even if specific points on my microbiome map are fuzzy, the overall landmarks appear to be solid.

[^1]: Gut microbiota dysbiosis and bacterial community assembly associated with cholesterol gallstones in large-scale study http://www.ncbi.nlm.nih.gov/pubmed/24083370

  [the web page for your sample]: https://app.ubiome.com/
  []: media/image1.png
  [1]: media/image2.jpg
  [Most scientists trust]: http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2045242/
  [the Github page for this book]: https://github.com/richardsprague/uBiome
  [2]: media/image3.png
  [3]: media/image4.png
  [4]: media/image5.png
  [5]: media/image6.png
  [***Enterobacteriales***]: https://en.wikipedia.org/wiki/Enterobacteriaceae
  [***Cronobacter***]: https://en.wikipedia.org/wiki/Cronobacter
  [**Greek mythological titan**]: https://en.wikipedia.org/wiki/Cronus
  [**no such thing as “good” or “bad” bacteria**]: http://www.nytimes.com/2011/11/01/health/scientist-examines-possible-link-between-antibiotics-and-obesity.html
  [are made in the gut]: http://www.ncbi.nlm.nih.gov/pubmed/22968153
  [B. infantis, which modulates tryptophan]: http://www.pnas.org/content/108/7/3047.long
  [that sleepy feeling]: http://www.webmd.com/food-recipes/features/the-truth-about-tryptophan
  [6]: media/image7.png
  [7]: media/image8.jpg
  [8]: media/image9.png
  [*Capnocytophaga*]: https://en.wikipedia.org/wiki/Capnocytophaga
  [Streptococcus rubneri]: http://www.ncbi.nlm.nih.gov/pubmed/23749274
  [Prevotella buccae]: https://microbewiki.kenyon.edu/index.php/Prevotella
  [Wikipedia]: https://en.wikipedia.org/wiki/Streptococcus_sanguinis
  [9]: https://en.wikipedia.org/wiki/Streptococcus_pseudopneumoniae
  [“treads the fine line between commensal and pathogen”]: http://www.cmnewsletter.com/article/S0196-4399(14)00027-0/abstract?cc=y
