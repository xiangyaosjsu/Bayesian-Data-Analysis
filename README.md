# <p align="center">Large Language Model’s Performance in Solving Math Problems: Take ChatGPT 3.5 and Bard as Examples </p>
<p align="center"> Xiang Yao </p>
<p align="center"> December 2023 </p>

## <p align="center">Introduction </p>
<p align="justify"> This study aims to employ Bayesian analysis method to evaluate the accurate rate of ChatGPT 3.5 and Bard in solving math problems, and to discern which model outperforms another and how much better. Thirty randomly sampled math questions, from four sets of SAT math practical problems, are used to collected ChatGPT and Bard’s responses. Based on binomial likelihood and Beta Conjugate prior, an independent Beta posterior is derived respectively for each of the two Large Language models (LLM). Accordingly, a posterior PDF for the successful rate difference is obtained. 95% Highest Posterior Density (HPD) is computed to summarize posterior uncertainty. Posterior predictive distribution (PPD) and sensitivity analysis are utilized to conduct model checking. Monte Carlos simulation is implemented to replicate posterior distribution data and exhibit analysis results.  </p>

## 1. Data Collection and Assumption Justification. 
<p align="justify"> SAT provides four full-length practice tests which contains eight modules and 216 math questions<sup>[1]</sup>. ChatGPT 3.5 doesn’t accept image input. Thus, those questions that have plot(s) are removed from question list. So, there are 184 candidate questions in total. I randomly sample 30 questions as the instrument to assess ChatGPT 3.5  and Bard’s performance. See Appendix I for sample questions and responses from ChatGPT 3.5 and Bard respectively; see Appendix II.1 for sample results. In total, ChatGPT 3.5 answers 26 questions correctly out of 30, approximately 86.67% correct rate; Bard answers 17 questions correctly out of 30, approximately 56.67% correct rate.
 </p>



 **Notes**
<p align="justify"> 1. Due to high demands, OpenAI temporarily pauses upgrades to ChatGPT 4.0 Version. Thus, ChatGPT 3.5 is used to test its performance. </p>
