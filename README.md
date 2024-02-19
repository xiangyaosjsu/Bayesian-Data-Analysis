# <p align="center">Large Language Model’s Performance in Solving Math Problems: Take ChatGPT 3.5 and Bard as Examples </p>
<p align="center"> Xiang Yao </p>
<p align="center"> December 2023 </p>

## <p align="center">Introduction </p>
<p align="justify"> This study aims to employ Bayesian analysis method to evaluate the accurate rate of ChatGPT 3.5 and Bard in solving math problems, and to discern which model outperforms another and how much better. Thirty randomly sampled math questions, from four sets of SAT math practical problems, are used to collected ChatGPT and Bard’s responses. Based on binomial likelihood and Beta Conjugate prior, an independent Beta posterior is derived respectively for each of the two Large Language models (LLM). Accordingly, a posterior PDF for the successful rate difference is obtained. 95% Highest Posterior Density (HPD) is computed to summarize posterior uncertainty. Posterior predictive distribution (PPD) and sensitivity analysis are utilized to conduct model checking. Monte Carlos simulation is implemented to replicate posterior distribution data and exhibit analysis results.  </p>

## 1. Data Collection and Assumption Justification. 
<p align="justify"> SAT provides four full-length practice tests which contains eight modules and 216 math questions<sup>1</sup>. ChatGPT 3.5 doesn’t accept image input. Thus, those questions that have plot(s) are removed from question list. So, there are 184 candidate questions in total. I randomly sample 30 questions as the instrument to assess ChatGPT 3.5 <sup> [1] </sup> and Bard’s performance. See Appendix I for sample questions and responses from ChatGPT 3.5 and Bard respectively; see Appendix II.1 for sample results. In total, ChatGPT 3.5 answers 26 questions correctly out of 30, approximately 86.67% correct rate; Bard answers 17 questions correctly out of 30, approximately 56.67% correct rate.
 </p>



 **Notes**
<p align="justify"> 1. Due to high demands, OpenAI temporarily pauses upgrades to ChatGPT 4.0 Version. Thus, ChatGPT 3.5 is used to test its performance. </p>

**Reference**

[1] SAT Full-Length Practice Tests. https://satsuite.collegeboard.org/digital/digital-practice-preparation/practice-tests/linear.

[2] Dao, X. Q., & Le, N. B. (2023). Investigating the Effectiveness of ChatGPT in Mathematical Reasoning and Problem Solving: Evidence from the Vietnamese National High School Graduation Examination. arXiv preprint arXiv:2306.06331.

[3] Nguyen, Phong; Nguyen, Phuong; Bruneau, Philippe; Cao, Linh; Wang, Jin; Truong, Hana (2023). Evaluation of Mathematics Performance of Google Bard on The Mathematics Test of the Vietnamese National High School Graduation Examination. TechRxiv. Preprint. https://doi.org/10.36227/techrxiv.23691876.v1.

[4] Bee Leng Lee. Math 264 Fall 2023 Semester, Lecture E, Slide 41. Problem Set 6, Question 3 (a). San Jose State University.

[5] PDF of the difference between two independent beta random variables. https://math.stackexchange.com/questions/1825768/pdf-of-the-difference-between-two-independent-beta-random-variables. 

[6] Pham-Gia, T., Turkkan, N., & Eng, P. (1993). Bayesian analysis of the difference of two proportions. Communications in Statistics-Theory and Methods, 22(6), 1755-1771.

[7] Hoffmann, T., Hofman, A., & Wagenmakers, E. J. (2022). Bayesian Tests of Two Proportions: A Tutorial With R and JASP. Methodology, 18(4), 239-277.

[8] What is Rejection Sampling? https://towardsdatascience.com/what-is-rejection-sampling-1f6aff92330d. 

[9] Analytical computation of the difference between two beta functions. https://osf.io/tdwgm.

[10] Bee Leng Lee. Math 264 Fall 2023 Semester, Lectures. San Jose State University.

