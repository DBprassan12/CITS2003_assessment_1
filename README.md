# Assignment 1 2022

Submission deadline: 11:59pm, Monday 2 May 2022.  
Value: 20% of CITS2003/CITS4407.  
To be done individually.

**This assignment will involve creating Shell scripts, which can call other Shell or Sed scripts. Each top-level script has been given a name. Please make sure you use the specified name as that is the name that we will use to test your scripts. You need to package all of these into a single submission consisting of a zip file, and submit the zip file [_cssubmit_](https://secure.csse.uwa.edu.au/run/cssubmit). No other method of submission is allowed.**

## 1. Exploring Malaria Incidence Data

[Kaggle](https://www.kaggle.com/) is a remarkable web-based, data science resource which contains a a huge number of different data sets and tutorials on tools. (Highly recommended.) One particular data set is the [World Health Organisation statistics for 2020](https://www.kaggle.com/utkarshxy/who-worldhealth-statistics-2020-complete). We have downloaded for you [data on the incidence of Malaria for a range of countries](https://teaching.csse.uwa.edu.au/units/CITS4407/assignments/2022_Ass1/incedenceOfMalaria.csv) and done a little pre-processing, mainly to convert real-valued incidence per 1,000 population into integers (because Shell can only handle integer data). Your program should explicitly read from `incedenceOfMalaria.csv`, which will be placed in the same directory as your program.

Your program should be called **`malaria_incidence`**. The program will be given a single argument. If the argument is a year, the program should report the country with the highest incidence and the corresponding incidence value for that year. On the other hand, if the argument is a country, the program should report the year with the highest incidence and the corresponding incidence value. In the case of several hits, do something that would make sense to the user. (Outputs will be assessed by a human, so we can deal with differences.) Finally, as you scan through the list of countries you will notice some that have further information in brackets; the bracketted information can be ignored. Sudan, where there is genuine ambiguity, will not be tested.

### 1.1. Examples

Here is an example session:

% ./malaria_incidence Afghanistan
For the country Afghanistan, the year with the highest incidence was 2002, with a rate of 104 per 1,000

% ./malaria_incidence 2004
For the year 2004, the country with the highest incidence was Solomon Islands, with a rate of 744 per 1,000

% ./malaria_incidence "Solomon Islands"
For the country Solomon Islands, the year with the highest incidence was 2004, with a rate of 744 per 1,000

Given that your submission will be not tested automatically, but assessed by a member of staff, slight variations in output format are acceptable.

### 1.2 Perhaps of Use

You will have noticed that names of countries have an initial capital letter, but not common words, such as "and". Thus a country in Africa that is in the database is Sao Tome and Principe; although it is part of the name, the "and" is not capitalized. However, the first word is captalized regardless, e.g. The. This is called title-case, i.e. the form of capitalisation used in title of books, articles, etc. Implementing this is a bit painful in Shell, so you may find useful the Python program that you can download from [here](https://teaching.csse.uwa.edu.au/units/CITS4407/assignments/2022_Ass1/title_case.py). Use it as you would any other Unix program. (You may have to make it executable using `chmod`.)

## 2. Common Words

This task is a development of the example that motivated several of the lectures in the unit: finding all the words in text, and from that, the most common word, etc. The program you are to write should be called **`common_words`**. With no arguments, the usage summary should be:

`Usage: common_words [-w word | -nth N] <directory of text files>`

The program will implement two related functions, indicated by the optional arguments `-w` and `-nth`, which are mutually exclusive. In both cases, the program also expects a mandatory argument, which is a directory containing text files.

If the optional argument `-w`, followed by a word, is provided, you must determine the frequency rank for that word in each text file and report the highest rank. Frequency ranks are numbered from 1 for the most common word in a file, 2 for second most common word in that file, etc. The program should report the text file for which the frequency rank of the specified word is highest along with the rank of the word in that file. If there are equal highest ranks, just return the first that your program finds.

If the optional argument `-nth`, followed by an integer N, is provided, your program is to report the word that is the Nth most common for the largest number of files in the specified directory. Your program must also report the number of files for which that word is Nth most common.

If there are no options, then assume you are being asked for the word that is the most common across the largest number of files, i.e. `-nth 1`

You can assume that all the text files in the text-file directory have the suffix `.txt`. As in the examples seen in lectures, for these purposes, a word is a sequence of one or more letters, so even though "common-garden" word-pair is linguistically one word, please treat them as two words. Secondly, unlike the examples in lectures, please preserve letter case. That is, please don't convert every letter to lower case.

In the directory [textfiles](https://teaching.csse.uwa.edu.au/units/CITS4407/assignments/2022_Ass1/text_files) you can find a selection of texts from the wonderful [Project Gutenberg](https://www.gutenberg.org/) archive of copy-right-free books.

### 2.1 Examples

Here is an example session based on the set of 10 texts in the Gutenberg sample linked above:

% ./common_words text_files
The 1th most common word is "the" across 9 files

% ./common_words -nth 2 text_files
The 2th most common word is "and" across 5 files

% ./common_words -w Alice text_files
The most significant rank for the word Alice is 12 in file AliceInWonderland.txt

% ./common_words -w I text_files
The most significant rank for the word I is 1 in file ADollsHouse.txt 

As in Part 1, the output format you use does not have to exactly match the one used here.

## 3. Marking criteria

The two programs are each worth 10 marks, but for convenience will be marked out of 20. Marking of programs will be on the basis of 80% for how the programs deal with different types of input, both input that conforms to expectations and error state input that anti-bugging should catch. The remaining 20% will be for style/maintainability.

### 3.1 Style Rubric

Much of this has been discussed in classes, but includes comments, meaningful variable names for meaningful variables (i.e. not throw away variables such as loop variables), and sensible anti-bugging. It also includes making sure your program removes any temporary files that were created along the way.

For the style/maintainability mark, the rubric is:

0 ≤ x < 1

Gibberish, impossible to understand

1 ≤ x < 2

Style is really poor, but can see where the train of thought may be heading

2 ≤ x < 3

Style is acceptable with some lapses

3 ≤ x < 4

Style is good or very good, with small lapses

4

Excellent style, really easy to read and follow
