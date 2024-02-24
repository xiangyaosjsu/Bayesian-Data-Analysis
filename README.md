# <p align="center">Large Language Model’s Performance in Solving Math Problems: Take ChatGPT 3.5 and Bard as Examples</p>
<p align="center"> Xiang Yao </p>
<p align="center"> December 2023 </p>

## <p align="center">Introduction </p>
<p align="justify"> This study aims to employ Bayesian analysis method to evaluate the accurate rate of ChatGPT 3.5 and Bard in solving math problems, and to discern which model outperforms another and how much better. Thirty randomly sampled math questions, from four sets of SAT math practical problems, are used to collected ChatGPT and Bard’s responses. Based on binomial likelihood and Beta Conjugate prior, an independent Beta posterior is derived respectively for each of the two Large Language models (LLM). Accordingly, a posterior PDF for the successful rate difference is obtained. 95% Highest Posterior Density (HPD) is computed to summarize posterior uncertainty. Posterior predictive distribution (PPD) and sensitivity analysis are utilized to conduct model checking. Monte Carlos simulation is implemented to replicate posterior distribution data and exhibit analysis results.  </p>

## 1. Data Collection and Assumption Justification. 
<p align="justify"> SAT provides four full-length practice tests which contains eight modules and 216 math questions<sup>1</sup>. ChatGPT 3.5 doesn’t accept image input. Thus, those questions that have plot(s) are removed from question list. So, there are 184 candidate questions in total. I randomly sample 30 questions as the instrument to assess ChatGPT 3.5 <sup> [1] </sup> and Bard’s performance. See <b>Appendix I</b> for sample questions and responses from ChatGPT 3.5 and Bard respectively; see <b>Appendix II.1 </b> for sample results. In total, ChatGPT 3.5 answers 26 questions correctly out of 30, approximately 86.67% correct rate; Bard answers 17 questions correctly out of 30, approximately 56.67% correct rate. </p>

<p align="justify"> <b>Exchangeability Justification.</b> Generally, there are two factors that might affect the probability to correctly answer a set of SAT questions, including question difficulty level and topics. The 184 math questions are combined to generate a single candidate question pool. These questions are assumed to have various difficulty levels and embody all required topics. However, the sample selection process doesn’t impose any restrictions to difficulty level or topics. Each question is independent, and there is no prior information regarding their topics or difficulty levels. So, the questions are exchangeable. </p>

<p align="justify"> Moreover, input questions are in English. Common math symbols are used, when necessary, e.g. Caret sign(’^’) for Exponentiation operation. I assume to recognize those math symbols is a basic capability of the measured LLMs. And the input of each question is the same for ChatGPT 3.5 and Bard. Each input initiates a new session so as to avoid context impacts. Thus, the input would not affect LLM’s response performance. Based on the above analysis, I am rather confident that the random quantities, whether each question is answered correctly or not by an LLM, are exchangeable. Their joint distribution doesn’t change if the sequence of their order is changed. </p>

## 2. Likelihood Distribution and Prior Specification
<p align="justify"> <b>(1) Sampling Model & Likelihood.</b> I am assessing how many of the 30 sample SAT math questions could be correctly answered by LLMs. Thus, the sampling model is binomial distribution, and the PDF is p($y_{i}$) = $\binom{30}{y_{i}}\theta^{y_{i}}(1 - \theta)^{30 - y_{i}}1_{\{ 0,1,\ldots,30\}}(y_{i})$ I do one experiment each for ChatGPT 3.5 and Bard. And they correctly answer 26 and 17 sample SAT math problems respectively. Thus, the <b>likelihoods</b> are: </p>

<p align="center"> <b>ChatGPT 3.5</b>: p($y_{C}|\theta_{C}$) = $\binom{30}{26}\theta_{C}^{26}\left( 1 - \theta_{C} \right)^{4}$, where $0 < \theta_{C} < 1$ <b>[1]</b> </p>

<p align="center"> <b>Bard</b>: p($y_{B}|\theta_{B}$) = $\binom{30}{17}\theta_{B}^{17}\left( 1 - \theta_{B} \right)^{13}$, where $0 < \theta_{B} < 1$ <b>[2]</b> </p>

<p align="justify"> <b>(2) Prior Specification: Conjugate Prior.</b> In this session, conjugate prior is developed separately for ChatGPT 3.5 and Bard likelihood, using different prior knowledge. 

p($y_{i}$) = $\binom{n}{y_{i}}\theta^{y_{i}}(1 - \theta)^{n - y_{i}}1_{\lbrace 0,1,\ldots,n \rbrace}(y_{i})$ 
= $\lbrack \binom{n}{y_{i}} 1_{\lbrace 0,1,\ldots,n \rbrace }(y_{i})\rbrack (1 - \theta)^{n}\{e^{y_{i}*\log^{\left( \frac{\theta}{1 - \theta} \right)}}\}$

We get: h($y_{i}$) = $\binom{n}{y_{i}} 1_{\lbrace 0,1,\ldots,n \rbrace}(y_{i})$; 
g($\theta$) = (1 - $\theta)^{n}$;
$q_{1}(\theta) = \log^{\left( \frac{\theta}{1 - \theta} \right)}$;
$t_{1}\left( y_{i} \right) = y_{i}$

<p align="justify">Thus, the sampling model is an exponential family. The conjugate prior is: </p>

p($\theta$) $\propto$
$(1 - \theta)^{\tau_{0}}\{ e^{\tau_{1}*\log^{\left( \frac{\theta}{1 - \theta} \right)}}\}$
= $\theta^{\tau_{1}}{(1 - \theta)}^{\tau_{0} - \tau_{1}}$

<p align="justify"> So, the prior distribution of $\theta$ is a Beta distribution with 
$\alpha = \tau_{1} + 1,\beta = \tau_{0} - \tau_{1} + 1$: </p>

<p align="center"> p($\theta$) =
$\frac{\Gamma(\tau_{0} + 2)}{\Gamma(\tau_{1} + 1)\Gamma(\tau_{0} - \tau_{1} + 1)}\theta^{\tau_{1}}{(1 - \theta)}^{\tau_{0} - \tau_{1}}1_{(0,1)}(\theta)$
<b>[3]</b> </p>

<p align="justify"> <b>Choice of Hyperparameters: ChatGPT 3.5.</b> A study, which assesses ChatGPT’s capabilities in the Mathematics Test of the Vietnamese National High School Graduation Examination (VNHSGE) in the year 2019-2023, discovers that the accuracy rate to answer VNHSGE math problems is in the range \[10%, 83%\]<sup>\[2\]</sup>. This study also
typically observes that ChatGPT could obtain a 70% success rate in the SAT Math competition.</p>

<p align="justify">VNHSGE is different from SAT test that they are designed to assess high school graduate’s mathematics capabilities in two different countries. However, I don’t have other relevant research findings in available as reference. Thus, I would like to construct ChatGPT’s prior distribution based on VNHSGE conclusion. I assume it is extremely likely that the correct rate of ChatGPT in solving SAT math problems would lie in the range \[10%, 83%\], such as a 95% probability. Meanwhile, I tend to consider 70% as the mode of the prior Beta distribution. Accordingly, we get the following equations: </p>

<p align="center"> 
$\int_{0.10}^{0.83}{\frac{\Gamma(\tau_{0} + 2)}{\Gamma(\tau_{1} + 1)\Gamma(\tau_{0} - \tau_{1} + 1)}\theta^{\tau_{1}}{(1 - \theta)}^{\tau_{0} - \tau_{1}}d\theta} = 0.95$
<b>[4]</b> 
</p>

<p align="center"> $\frac{\alpha - 1}{\alpha + \beta - 2} = \frac{\tau_{1}}{\tau_{0}} = 0.7$  <b>[5] </b> </p>

<p align="justify">
Through solving equation \[4\] & \[5\], I get $\tau_{0}$=20.80 & $\tau_{1}$=14.56. That is $\alpha = 15.56,\beta = 7.24$. Therefore, the <b>Conjugate Prior for ChatGPT 3.5</b> likelihood is </p>

<p align="center">
p($\theta_{C}$)= $\frac{\Gamma(22.80)}{\Gamma(15.56)\Gamma(7.24)}\theta_{C}^{14.56}{(1 - \theta_{C})}^{6.24}1_{(0,1)}(\theta_{C})$
<b>[6]</b> 
</p>

<p align="justify"> <b>Choice of Hyperparameters: Bard.</b> I didn’t find a valid prior study regarding how accurately Bard could answer math questions, particularly SAT math questions. Thus, I would like to take ChatGPT’s prior accuracy range as Bard’s. Meanwhile, A recent study, which also uses 2019-2023 VNHSGE questions to assess Bard’s capabilities in solving math problems, concludes that “Bard achieved an accurate rate of 38.8%, lagging behind ChatGPT and BingChat”<sup>\[3\]</sup>. The accurate rate 38.8% is an
average of the five-year accurate rate. Therefore, I tend to take 40% as the mean of the prior correct rate of Bard. Accordingly, I get the following equations: </p>

<p align="center"> $\int_{0.1}^{0.83}{\frac{\Gamma(\tau_{0} + 2)}{\Gamma(\tau_{1} + 1)\Gamma(\tau_{0} - \tau_{1} + 1)}\theta^{\tau_{1}}{(1 - \theta)}^{\tau_{0} - \tau_{1}}d\theta} = 0.95$
<b>[7]</b> </p>

<p align="center"> $\frac{\alpha}{\alpha + \beta} = \frac{\tau_{1} + 1}{\tau_{0} + 2} = 0.4$ <b>[8]</b> </p>

<p align="justify"> Through solving equation \[7\] & \[8\], I get $\tau_{0}$=3.78 &
$\tau_{1}$=1.31. That is $\alpha = 2.31,\beta = 3.47$. Therefore, the
<b>Conjugate Prior for Bard</b> is </p>

<p align="center"> $p(\theta_{B})$ =
$\frac{\Gamma(5.78)}{\Gamma(2.31)\Gamma(3.47)}\theta_{B}^{1.31}{(1 - \theta_{B})}^{2.47}1_{(0,1)}(\theta_{B})$
<b>[9]</b> </p>

## 3. Posterior Distribution: $p(\theta_C \mid y_C)$ & $p(\theta_B \mid y_B)$
<p align="justify"> <b>(1) ChatGPT 3.5.</b> $p(\theta_{C}|y_{C})$ $\propto$
p($y_{C}|\theta_{C}$) p($\theta_{C}$)
$\propto$
$\theta_{C}^{26}\left( 1 - \theta_{C} \right)^{4}\theta_{C}^{14.56}{(1 - \theta_{C})}^{6.24}1_{(0,1)}(\theta_{C})$
= $\theta_{C}^{40.56}{(1 - \theta_{C})}^{10.24}1_{(0,1)}(\theta_{C})$
</p>

<p align="justify"> 
This is a Beta Kernel with
$\alpha = 41.56,\beta = 11.24,\alpha + \beta = 52.80$. 
Thus, <b>Posterior Distribution for ChatGPT 3.5</b> is: 
</p>

<p align="center"> 
$p(\theta_{C}|y_{C})$ =
$\frac{\Gamma(52.80)}{\Gamma(41.56)\Gamma(11.24)}\theta^{40.56}{(1 - \theta_{C})}^{10.24}1_{(0,1)}(\theta_{C})$
<b>[10]</b> 
</p>

<p align="justify">
<b>(2) Bard.</b> 
p($\theta_{B}|y_{B}$) $\propto$ p($y_{B}|\theta_{B}$)p($\theta_{B}$)
$\propto$ $\theta_{B}^{17}\left( 1 - \theta_{B} \right)^{13}\theta_{B}^{1.31}{(1 - \theta_{B})}^{2.47}1_{(0,1)}(\theta_{B})$
= $\theta_{B}^{18.31}{(1 - \theta_{B})}^{15.47}1_{(0,1)}(\theta_{B})$ 
</p>

<p align="justify"> 
This is Beta Kernel with
$\alpha = 19.31,\beta = 16.47,\alpha + \beta = 35.78$. 
Thus, <b>Posterior Distribution for Bard</b> is: 
</p>

<p align="center">
$p(\theta_{B}|y_{B})$ = $\frac{\Gamma(35.78)}{\Gamma(19.31)\Gamma(16.47)}\theta_{B}^{18.31}{(1 - \theta_{B})}^{15.47}1_{(0,1)}(\theta_{B})$
<b>[11]</b> 
</p>

## 4. Summarizing Posterior Uncertainty
<p align="justify">
Above all, we can see certain evolutions from prior to posterior for both LLMs (See <b>Figure 1</b>). For ChatGPT 3.5, the probable successful rate to respond to a SAT math question evolves from 70% to 80% with much stronger beliefs. The peak density of posterior is much higher than that of prior. Meanwhile, the posterior has much less uncertainty than prior. The width of the spread of prior is in the range [0.35, 0.9], but this range diminishes to be around [0.6, 0.9]. A similar trend is noticed for Bard. The most probable correct rate evolves from 35% in prior to 54% in posterior and the belief gets much stronger in posterior than in prior. The peak density of posterior is much higher than that of prior. The uncertainty
also greatly decreased. The width of the spread of prior is almost [0, 1], but changes to be around [0.3, 0.7] in posterior.
</p>

<img src="images/Figure 1.png" width="99%" />
<p align="center" margin-top=0> <b>Figure 1. Prior & Posterior Distribution of Theta: ChatGPT 3.5 vs. Bard </b> </p>

<p align="justify">
The <b>95% Highest posterior density (HPD)</b> credible interval for ChatGPT 3.5 and Bard to correctly answer SAT math problems is [67.78%, 91.21%] and [43.04%, 64.82%] respectively (See <b>Table 1</b>). Posterior mode for ChatGPT 3.5 = $\frac{41.56 - 1}{52.80 - 2} \approx 80\%$; posterior mode for Bard = $\frac{19.31 - 1}{35.78 - 2} \approx 54\%$. ChatGPT 3.5 would mostly have a correct rate above 65%. However, Bard would mostly have a correct rate below 65%. According to the 95% HPD credible intervals, ChatGPT 3.5 surpasses Bard in terms of correctly respond to SAT math problems in most times.
</p>

<div align="center">
<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 28%" />
<col style="width: 25%" />
<col style="width: 28%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>LLMs</strong></th>
<th><strong>Prior Distribution</strong></th>
<th><strong>Posterior Distribution</strong></th>
<th><p><strong>95% HPD</strong></p>
<p><strong>Credible Interval</strong></p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>ChatGPT 3.5</strong></td>
<td>Beta (<span
class="math inline"><em>α</em> = 15.56, <em>β</em> = 7.24</span>)</td>
<td>Beta (α=41.56,β=11.24)</td>
<td>[67.78%, 91.21%]</td>
</tr>
<tr class="even">
<td><strong>Bard</strong></td>
<td>Beta (α=2.31,β=3.47)</td>
<td>Beta (α=19.31,β=16.47)</td>
<td>[43.04%, 64.82%]</td>
</tr>
</tbody>
</table>
</div>

<p align="center"> <b>Table 1. Prior, Posterior and 95% HPD Credible Interval: ChatGPT 3.5 vs. Bard </b> </p>

## 5. Model Checking
<p align="justify">Posterior Predictive Distribution (PPD) and sensitivity analysis is applied to check whether the derived posterior model is consistent with the data of interest. </p>

<p align="justify">
<b>(1) Posterior Predictive Distribution (PPD).</b> 
The likelihood for posterior replication is 
p($y^{rep}|\theta$) = $\binom{30}{y^{rep}}\theta^{y^{rep}}(1 - \theta)^{30 - y^{rep}}$, where
$0 < \theta < 1$. 
Then, p($y^{rep}|y$) = $\int_{0}^{1}{p(y^{rep}|\theta)p(\theta|y)d\theta}$
</p>

<div align="center">

<b>ChatGPT 3.5:</b>p($y^{rep}|y$) = $\int_{0}^{1} {\binom{30}{y^{rep}} \theta^{y^{rep}}(1 - \theta)^{30 - y^{rep}}
\frac{\Gamma(52.80)}{\Gamma(41.56)\Gamma(11.24)}
\theta^{40.56}
{(1 - \theta_{C})}^{10.24} d\theta}$

= $\binom{30}{y^{rep}} \frac{\Gamma(52.80)}{\Gamma(41.56)\Gamma(11.24)}
\frac{\Gamma(y^{rep} + 41.56)\Gamma(41.24 - y^{rep})}{\Gamma(82.80)}1_{\{ 0,1,\ldots,30\}}
(y^{rep})$
**\[12\]**
</div>

<div align="center">
  
<b>Bard:</b>p($y^{rep}|y$) = $\int_{0}^{1}{\binom{30}{y^{rep}}\theta^{y^{rep}}(1 - \theta)^{30 - y^{rep}}\frac{\Gamma(35.78)}{\Gamma(19.31)\Gamma(16.47)}\theta_{B}^{18.31}{(1 - \theta_{B})}^{15.47}d\theta}$

= $\binom{30}{y^{rep}}\frac{\Gamma(35.78)}{\Gamma(19.31)\Gamma(16.47)}\frac{\Gamma(y^{rep} + 19.31)\Gamma(46.47 - y^{rep})}{\Gamma(65.78)}1_{\{ 0,1,\ldots,30\}}(y^{rep})$
**\[13\]**
</div>

<p align="justify">
To graphically exhibit whether the derived posterior model well resemble the empirical distribution, I use posterior PDF to simulate 5,000 samples for each LLM posterior. Then, I get two sets of 5,000 $y_{i}$. The average success number for 5,000 ChatGPT replicated samples is about 24; the corresponding average success number for 5,000 Bard samples is 16. Compared to the observation value, the replicated data well resemble the observations. There is no obvious big discrepancy between observation and posterior predictive values (See <b>Figure 2</b>). Thus, from the perspective of PPD, the model fit is very good (See <b>Appendix II.2</b> for another summary of the PPD that uses the number of questions is
correctly answered. It also supports a very good model fit).
</p>

<img src="images/Figure 2.png" width="99%" />
<p align="center"> <b>Figure 2. Posterior Predictive Distribution: ChatGPT 3.5 vs. Bard</b> </p>

<p align="justify">
<b>(2) Sensitivity Analysis: Conjugate Prior vs. Jeffreys Prior.</b> 
To do sensitivity analysis, I use Jeffreys prior to derive posteriors for the two LLMs to see whether the posteriors based on different priors have a big variation. The reason to compare conjugate and Jeffreys prior is because they represent informative and non-informative or weak-informative priors. If posterior derived based on them don’t have big variation, less sensitivity or variation of the posterior could be concluded. Jeffreys prior for binomial likelihood p($\theta$) is Beta ($\frac{1}{2}$, $\frac{1}{2}$)<sup>\[4\]</sup>. So, p($\theta$) $\propto \theta^{- \frac{1}{2}}(1 - \theta)^{- \frac{1}{2}}1_{(0,1)}(\theta)$ <b>[14]</b>. The computation process of posterior distributions based on
Jeffreys prior for ChatGPT 3.5 and Bard is in the <b>Appendix II.3</b>. The posterior distributions are: 
</p>

<p align="center">
<b>ChatGPT 3.5:</b> 
p($\theta|y$) = $\frac{\Gamma(31)}{\Gamma(26.5)\Gamma(4.5)}\theta^{25.5}(1 - \theta)^{3.5}1_{(0,1)}(\theta)$
<b>[15] </b>
</p>

<p align="center">
<b>Bard:</b> 
p($\theta|y$) = $\frac{\Gamma(31)}{\Gamma(17.5)\Gamma(13.5)}\theta^{16.5}(1 - \theta)^{12.5}1_{(0,1)}(\theta)$
<b> [16] </b>
</p>

<p align="justify">
As we see in <b>Figure 3</b>, Jeffreys prior has a strong opinion that the probability is either smaller than 10% or larger than 90%. Jeffreys and conjugate priors are quite different both in ChatGPT case and Bard case. However, for both ChatGPT and Bard case, the posteriors derived from two quite different prior distributions don’t have an obvious big discrepancy. Particularly, for Bard case, the conjugate posterior and Jeffreys posterior resembles each other very much. The difference between two posteriors in ChatGPT case is bigger than that in Bard model. But the discrepancy is not very big either. This conclusion could be supported by posterior quartiles as well (See <b>Table 2</b>). The 25%, 50% and 75% posterior quartiles difference between conjugate and Jeffreys prior is smaller than 0.03. The probability that the posterior correct rate is not larger than 80% is approximately 1 for both priors. Thus, <b>the model fit for Bard is pretty good</b> with very little variations cross different priors. For ChatGPT case, the corresponding posterior quartile difference between conjugate and Jeffreys prior is about 0.07. Not a big discrepancy either. However, the probability that the posterior correct rate is not larger than 80% is about 57% and 18% for conjugate prior and Jeffreys prior respectively. This discrepancy is not small. Thus, <b>the model fit for ChatGPT is moderate</b> that with some variation across different priors.
</p>

<img src="images/Figure 3.png" width="99%" />
<p align="center"> <b>Figure 3 Sensitivity Analysis: Conjugate vs. Jeffreys Prior Density </b> </p>

<div align="center">

<table>
  <tr>
    <th rowspan="2">Posterior Quartile</th>
    <th colspan="2" scope="colgroup">ChatGPT 3.5</th>
    <th colspan="2" scope="colgroup">Bard</th>
  </tr>
  <tr>
    <th scope="col">Conjugate Prior</th>
    <th scope="col">Jeffreys Prior</th>
    <th scope="col">Conjugate Prior</th>
    <th scope="col">Jeffreys Prior</th>
  </tr>
  <tr>
    <td>First</td><td>0.75</td><td>0.82</td><td>0.48</td><td>0.50</td>
  </tr>
  <tr>
    <td>Median</td><td>0.79</td><td>0.86</td><td>0.54</td><td>0.57</td>
  </tr>
  <tr>
    <td>Third</td><td>0.83</td><td>0.90</td><td>0.60</td><td>0.63</td>
  </tr>
  <tr>
    <td><b>Pr(θ≤0.8|y)</b></td><td>0.566</td><td>0.183</td><td>0.9997</td><td>0.998</td>
  </tr>
</table>

</div>

<p align="center"> <b>Table 2. Sensitivity Analysis: Conjugate vs. Jeffreys Posterior Quartile </b> </p>

## 6. How Different is ChatGPT 3.5 and Bard in Response Accuracy to SAT Math Problems?

**(1) PDF for Posterior Difference $\theta_{C} - \theta_{B}$**

To compare the posterior difference, we need to do reparameterization and generate a single PDF for
$\theta_{C,\ post} - \theta_{B,\ post}$<sup>\[5\]</sup>. Firstly, assumption justification. The two LLMs are developed completely
independent with each other. The two posterior distributions for ChatGPT 3.5 and Bard is obtained independently using different
likelihood and prior distribution. Consequently, the two posteriors are independent with each other. So, the joint distribution
of $p\left( \theta_{C} \middle| y_{C} \right)$ &  $p(\theta_{B}|y_{B})$ is the product of them: 

<div align="center">

$p\left( \theta_{C,\ post},\theta_{B,\ post} \middle| y_{C},y_{B} \right) $
$= p\left( \theta_{C,\ post} \middle| y_{C} \right)p\left( \theta_{B,\ post} \middle| y_{B} \right)$
$= \frac{\Gamma\left( \alpha_{C} + \beta_{C} \right)}{\Gamma\left( \alpha_{C} \right)\Gamma\left( \beta_{C} \right)}\theta_{C}^{\alpha_{C} - 1}\left( 1 - \theta_{C} \right)^{\beta_{C} - 1}\frac{\Gamma\left( \alpha_{B} + \beta_{B} \right)}{\Gamma\left( \alpha_{B} \right)\Gamma\left( \beta_{B} \right)}{\theta_{B}^{\alpha_{B} - 1}\left( 1 - \theta_{B} \right)}^{\beta_{B} - 1}$ **\[17\]**
  
</div>

Let
$\gamma = \theta_{C,\ post} - \theta_{B,\ post},\ \gamma \in \lbrack - 1,\ 1\rbrack;\nu = \theta_{C,\ post}$,
$\nu \in \lbrack 0,1\rbrack$.

Then, $\theta_{C, post} = \nu,\theta_{B, post} = \nu - \gamma $

$$
\mid J \mid = \left| \begin{matrix}
\frac{\partial_{\gamma}}{\partial_{\theta_{C,\ post}}} & 
\frac{\partial_{\gamma}}{\partial_{\theta_{B,\ post}}} \\
\frac{\partial_{\nu}}{\partial_{\theta_{C,\ post}}} & 
\frac{\nu}{\partial_{\theta_{B,\ post}}}
\end{matrix} \right| 
= \left| \begin{matrix}
1 & - 1 \\
1 & 0
\end{matrix} \right| 
= 1
$$

$$p(\gamma,\nu) = p\left( \theta_{C,\ post},\theta_{B,\ post}  \middle|  y_{C},y_{B} \right)|J| \\
= \frac{\Gamma\left( \alpha_{C} + \beta_{C} \right)}{\Gamma\left( \alpha_{C} \right)\Gamma\left( \beta_{C} \right)} \\
\theta_{C}^{\alpha_{C} - 1} \left( 1 - \theta_{C} \right)^{\beta_{C} - 1} \\
\frac{\Gamma\left( \alpha_{B} + \beta_{B} \right)}{\Gamma\left( \alpha_{B} \right)\Gamma\left( \beta_{B} \right)} \\
{\theta_{B}^{\alpha_{B} - 1}\left( 1 - \theta_{B} \right)}^{\beta_{B} - 1} 
$$

$$
=\frac{\Gamma\left( \alpha_{C} + \beta_{C} \right)}{\Gamma\left( \alpha_{C} \right)\Gamma\left( \beta_{C} \right)} \\
\frac{\Gamma\left( \alpha_{B} + \beta_{B} \right)}{\Gamma\left( \alpha_{B} \right)\Gamma\left( \beta_{B} \right)} \\
\nu^{\alpha_{C} - 1}{(1 - \nu)}^{\beta_{C} - 1}{(\nu - \gamma)^{\alpha_{B} - 1}(1 - \nu + \gamma)}^{\beta_{B} - 1} **\[18\]**
$$

$$
p(\gamma) = \int_{- 1}^{1}{p(\gamma,\nu)d\nu\ } = \int_{- 1}^{1} \\
{\frac{\Gamma\left( \alpha_{C} + \beta_{C} \right)}{\Gamma\left( \alpha_{C} \right)\Gamma\left( \beta_{C} \right)} \\
\frac{\Gamma\left( \alpha_{B} + \beta_{B} \right)}{\Gamma\left( \alpha_{B} \right)\Gamma\left( \beta_{B} \right)} \\
\nu^{\alpha_{C} - 1} {(1 - \nu)}^{\beta_{C} - 1}{(\nu - \gamma)^{\alpha_{B} - 1} (1 - \nu + \gamma)}^{\beta_{B} - 1}d\nu} **\[19\]**
$$

<p align="justify">According to Pham-Gia & Turkkan’s study<sup>[6][7]</sup>, this complicated integration in equation [19] is a piecewise function: </p>

<div align="center"><img src="images/Formula 20.png"/></div>

Where A =
$\frac{\Gamma\left( \alpha_{C} + \beta_{C} \right)}{\Gamma\left( \alpha_{C} \right)\Gamma\left( \beta_{C} \right)}
\frac{\Gamma\left( \alpha_{B} + \beta_{B} \right)}{\Gamma\left( \alpha_{B} \right)\Gamma\left( \beta_{B} \right)}$.
$F_{1}$ is the Appell’s first hypergeometric function in two variables (See <b>Appendix II.4</b>). Then, PDF function of p$(\gamma)$ is computed by R.

<p align="justify"> <b>(2) 95% HPD vs. 95% Quartile of Monte Carlos Simulation.</b> To obtain the 95% HPD credible region, I need the random generation for p(γ). However, it is not easy to derive random samples from this sophisticated PDF p(γ) (See <b>Equation [20] </b>). Thus, I employed the rejection sampling method to extract distribution samples from p(γ) <sup>[8][9]</sup>. Then, based on the extracted distribution samples, p.interval() function gives the 95% HPD credible region as [0.03, 0.50] (See <b> Code 5.(2)</b>). This credible region could be interpreted as, given the observed data y<sup>C</sup> and y<sup>B</sup>, there is a 95% probability that posterior θ<sup>C</sup> - θ<sup>B</sup> lies in credible interval [0.03, 0.50]. It indicates ChatGPT 3.5 performs better than Bard in correctly respond to SAT math problems in most of the times since the whole 95% HPD credible region is larger than 0. And, most probably, ChatGPT 3.5 could outperform Bard in correctly respond to SAT math problems at about 25% (Mode of posterior θ<sup>C</sup> - θ<sup>B</sup> ≈ 0.25). (See <b>Figure 4</b>)
</p>

<p align="justify">Meanwhile, it is found that the probabilities, that the posterior correct rate difference between ChatGPT and Bard (θ<sup>C</sup> - θ<sup>B</sup>) is larger than 10%, 20% and 30%, are 92.97%, 68.37% and 30.14% respectively (See <b>Table 3</b>).” </p>

<div align="center">
  
| $p(\theta_{C} - \theta_{B} > 0.1 \|y)$  | $p(\theta_{C} - \theta_{B} > 0.2 \|y)$ | $p(\theta_{C} - \theta_{B} > 0.3 \|y)$ |
|-----------------------------------------|----------------------------------------|----------------------------------------|
| 92.97%                                  | 68.37%                                 | 30.14%                                 |

</div>

<p align="center"> <b>Table 3. Probability of Posterior Correct Rate Difference </b> </p>

<img src="images/Figure 4.png" width="99%" />
<p align="center"> <b>Figure 4. 95% HPD Credible Region for:
$$\theta_{C} - \theta_{B}$$
Mathematical vs. Monte Carlos Simulation </b> </p>

## 7. Conclusion
<p align="justify">The Beta posterior distributions which is derived by the Binomial likelihood and Beta conjugate prior for ChatGPT 3.5 is of moderate model fit; the Beta posterior for Bard is of very good model fit. Most probably, ChatGPT 3.5’s posterior model could obtain about 80% correct rate with a 95% HPD credible region at [67.78%, 91.21%]; the corresponding mode for Bard is about 54% with a 95% HPD credible region at [43.04%, 64.82%]. Simply speaking, ChatGPT 3.5 has a much better correct rate than Bard in solving SAT math problems. </p>

<p align="justify">Moreover, the mathematically derived PDF samples for posterior $\theta_{ChatGPT\ 3.5} - \theta_{Bard}$ clearly and confidently identify that ChatGPT 3.5 manifestly outperforms Bard in correctly responding to SAT math questions as well. All in all, I would bet 95 cents for $1 that ChatGPT have higher correct rate than Bard when handling mathematics problems on high school level difficulty; bet 90 cents, 65 cents and 30 cents respectively that the correct rate for ChatGPT is 10%, 20% and 30% larger than that of Bard.   </p>



**Notes**
1. There are 4 practice tests. Each practice test has 2 modules of Math. Thus, there are 8 modules of math tests in total.

2. Each math module has 27 questions.

3. If ChatGPT 3.5/Bard’s response to the question is the same as the correct answer, its score is 1; otherwise, score is 0

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


**Appendix I: Sample Math Questions and Responses**

<table>
<colgroup>
<col style="width: 5%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 38%" />
<col style="width: 6%" />
<col style="width: 8%" />
<col style="width: 7%" />
<col style="width: 11%" />
<col style="width: 5%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Obs.</strong></th>
<th><strong>Test Module<sup>1</sup></strong></th>
<th><strong>Question #<sup>2</sup></strong></th>
<th><strong>Question Input</strong></th>
<th><strong>Correct Answer</strong></th>
<th><strong>ChatGPT 3.5 Response</strong></th>
<th><strong>ChatGPT 3.5 Score<sup>3</sup></strong></th>
<th><strong>Bard Response</strong></th>
<th><strong>Bard Score<sup>3</sup></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>1</td>
<td>A</td>
<td>5</td>
<td>Each face of a fair 14-sided die is labeled with a number from 1
through 14, with a different number appearing on each face. If the die
is rolled one time, what is the probability of rolling a 2? A) 1/14; B)
2/14; C) 12/14; D) 13/14</td>
<td>A</td>
<td>A</td>
<td>1</td>
<td>A</td>
<td>1</td>
</tr>
<tr class="even">
<td>2</td>
<td>A</td>
<td>7</td>
<td>The function f is defined by the equationf(x) = 7x + 2. What is the
value of f(x) when x=4?</td>
<td>30</td>
<td>30</td>
<td>1</td>
<td>30</td>
<td>1</td>
</tr>
<tr class="odd">
<td>3</td>
<td>A</td>
<td>23</td>
<td><p>A certain town has an area of 4.36 square miles. What is the
area, in square yards, of this town? (1 mile = 1,760 yards)</p>
<p>A) 404; B) 7,674; C) 710,459; D) 13,505,536</p></td>
<td>D</td>
<td>D</td>
<td>1</td>
<td>D</td>
<td>1</td>
</tr>
<tr class="even">
<td>4</td>
<td>A</td>
<td>25</td>
<td>In the xy-plane, the graph of the equation y = −x^2 + 9x − 100
intersects the line y = c at exactly one point. What is the value of c?
A) -481/4; B) -100; C) -319/4; D) -9/2</td>
<td>C</td>
<td>C</td>
<td>1</td>
<td>No such value</td>
<td>0</td>
</tr>
<tr class="odd">
<td>5</td>
<td>B</td>
<td>1</td>
<td>Tilly earns p dollars for every w hours of work. Which expression
represents the amount of money, in dollars, Tilly earns for 39w hours of
work? A) 39p; B) p/39; C) p+39; D) p-39</td>
<td>A</td>
<td>A</td>
<td>1</td>
<td>A</td>
<td>1</td>
</tr>
<tr class="even">
<td>6</td>
<td>B</td>
<td>9</td>
<td><p>The function f is defined by f (x) = 7x^3. In the xy-plane, the
graph of y = g(x) is the result of shifting the graph of y = f (x) down
2 units. Which equation defines function g ? A) g(x)=(7/2)x^3;</p>
<p>B) g(x)=7x^(3/2); C) g(x)=7x^3+2; D) g(x) = 7x^3−2</p></td>
<td>D</td>
<td>D</td>
<td>1</td>
<td>D</td>
<td>1</td>
</tr>
<tr class="odd">
<td>7</td>
<td>B</td>
<td>12</td>
<td><p>The function p is defined by p(n) = 7n^3. What is the value of n
when p(n) is equal to 56?</p>
<p>A) 2; B) 8/3; C) 7; D) 8</p></td>
<td>A</td>
<td>A</td>
<td>1</td>
<td>n=2<br />
n=−1+ sqrt(3) ⋅(i)<br />
n=−1+ sqrt(3) ⋅(-i)</td>
<td>0</td>
</tr>
<tr class="even">
<td>8</td>
<td>B</td>
<td>20</td>
<td>An event planner is planning a party. It costs the event planner a
onetime fee of $35 to rent the venue and $10.25 per attendee. The event
planner has a budget of $200. What is the greatest number of attendees
possible without exceeding the budget?</td>
<td>16</td>
<td>16</td>
<td>1</td>
<td>16</td>
<td>1</td>
</tr>
<tr class="odd">
<td>9</td>
<td>C</td>
<td>19</td>
<td><p>The function h is defined by h(x) = 4x + 28.The graph of y = h(x)
in the xy-plane has an x-intercept at (a, 0) and a y-intercept at (0,
b), where a and b are constants. What is the value of a+b?</p>
<p>A) 21; B) 28; C) 32; D) 35</p></td>
<td>A</td>
<td>A</td>
<td>1</td>
<td>A</td>
<td>1</td>
</tr>
<tr class="even">
<td>10</td>
<td>C</td>
<td>20</td>
<td>One of the factors of 2x^3_42x^2+208x is x+b, where b is a positive
constant. What is the smallest possible value of b ?</td>
<td>8</td>
<td>8</td>
<td>1</td>
<td>8</td>
<td>1</td>
</tr>
<tr class="odd">
<td>11</td>
<td>C</td>
<td>23</td>
<td><p>For the function q, the value of q(x) decreases by 45% for every
increase in the value of x by 1. If q(0) = 14, which equation defines
q?</p>
<p>A) q(x) = 0.55(14)^x; B) q(x) = 1.45(14)^x;</p>
<p>C) q(x) = 14(0.55)^x; D) q(x) = 14(1.45)^x</p></td>
<td>C</td>
<td>C</td>
<td>1</td>
<td>A</td>
<td>0</td>
</tr>
<tr class="even">
<td>12</td>
<td>C</td>
<td>25</td>
<td>RS=20, ST = 48, TR = 52. The side lengths of right triangle RST are
given. Triangle RST is similar to triangle UVW , where S corresponds to
V and T corresponds to W. What is the value of tan W ?<br />
A) 5/13; B) 5/12; C) 12/13; D) 12/5</td>
<td>B</td>
<td>B</td>
<td>1</td>
<td>sqrt(26)</td>
<td>0</td>
</tr>
<tr class="odd">
<td>13</td>
<td>D</td>
<td>2</td>
<td><p>Jay walks at a speed of 3 miles per hour and runs at a speed of 5
miles per hour. He walks for w hours and runs for r hours for a combined
total of 14 miles. Which equation represents this situation? A)
3w+5r=14; B) (1/3)w+(1/5)r=14;</p>
<p>C) (1/3)w+(1/5)r=112; D) 3w+5r=112</p></td>
<td>A</td>
<td>A</td>
<td>1</td>
<td>A</td>
<td>1</td>
</tr>
<tr class="even">
<td>14</td>
<td>D</td>
<td>8</td>
<td>5x=15, -4x+y=-2. The solution to the given system of equations is
(x, y). What is the value of x + y ? A) −17; B) −13; C) 13; D) 17</td>
<td>C</td>
<td>C</td>
<td>1</td>
<td>C</td>
<td>1</td>
</tr>
<tr class="odd">
<td>15</td>
<td>D</td>
<td>13</td>
<td>Out of 300 seeds that were planted, 80% sprouted. How many of these
seeds sprouted?</td>
<td>240</td>
<td>240</td>
<td>1</td>
<td>240</td>
<td>1</td>
</tr>
<tr class="even">
<td>16</td>
<td>D</td>
<td>17</td>
<td>f(t)=8,000(0.65)^t. The given function f models the number of
coupons a company sent to their customers at the end of each year, where
t represents the number of years since the end of 1998, and 0 ≤ t ≤ 5.If
y = f(t) is graphed in the ty-plane, which of the following is the best
interpretation of the y-intercept of the graph in this context?<br />
A) The minimum estimated number of coupons the company sent to their
customers during the 5 years was 1,428.<br />
B) The minimum estimated number of coupons the company sent to their
customers during the<br />
5 years was 8,000.<br />
C) The estimated number of coupons the company sent to their customers
at the end of 1998 was 1,428.<br />
D) The estimated number of coupons the company sent to their customers
at the end of 1998 was 8,000.</td>
<td>D</td>
<td>D</td>
<td>1</td>
<td>D</td>
<td>1</td>
</tr>
<tr class="odd">
<td>17</td>
<td>D</td>
<td>19</td>
<td>y=6x+18. One of the equations in a system of two linear equations is
given. The system has no solution. Which equation could be the second
equation in the system? A) −6x+y=18; B) −6x+y=22; C) −12x+y=36; D)
−12x+y=18</td>
<td>B</td>
<td>C &amp; D</td>
<td>0</td>
<td>A</td>
<td>0</td>
</tr>
<tr class="even">
<td>18</td>
<td>E</td>
<td>2</td>
<td>The function f is defined by f (x) = x^3 + 15. What is the value of
f(2)? A) 20; B) 21; C) 23; D) 24</td>
<td>C</td>
<td>C</td>
<td>1</td>
<td>23/2</td>
<td>0</td>
</tr>
<tr class="odd">
<td>19</td>
<td>E</td>
<td>3</td>
<td>Sean rents a tent at a cost of $11 per day plus a onetime insurance
fee of $10. Which equation represents the total cost c, in dollars, to
rent the tent with insurance for d days? A) c = 11(d+10); B) c =
10(d+11); C) c=11d+10; D) c=10d+11</td>
<td>C</td>
<td>C</td>
<td>1</td>
<td>C</td>
<td>1</td>
</tr>
<tr class="even">
<td>20</td>
<td>E</td>
<td>6</td>
<td>If y = 5x + 10,what is the value of y when x = 8 ?</td>
<td>50</td>
<td>50</td>
<td>1</td>
<td>50</td>
<td>1</td>
</tr>
<tr class="odd">
<td>21</td>
<td>E</td>
<td>18</td>
<td>The product of two positive integers is 546. If the first integer is
11 greater than twice the second integer, what is the smaller of the two
integers? A) 7; B) 14; C) 39; D) 78</td>
<td>B</td>
<td>None</td>
<td>0</td>
<td>A</td>
<td>0</td>
</tr>
<tr class="even">
<td>22</td>
<td>E</td>
<td>19</td>
<td>y≤x+7, y ≥ −2x−1. Which point (x, y) is a solution to the given
system of inequalities in the xy-plane? A) (−14,0); B) (0, −14); C) (0,
14); D) (14,0)</td>
<td>D</td>
<td>All choices</td>
<td>0</td>
<td>A graph and Python code is given</td>
<td>0</td>
</tr>
<tr class="odd">
<td>23</td>
<td>E</td>
<td>27</td>
<td>The graph of x^2 + x + y^2 + y = 199/2 in the xy-plane is a circle.
What is the length of the circle’s radius?</td>
<td>10</td>
<td>10</td>
<td>1</td>
<td>49/2</td>
<td>0</td>
</tr>
<tr class="even">
<td>24</td>
<td>F</td>
<td>13</td>
<td>A circle has center O, and points R and S lie on the circle. In
triangle ORS, the measure of ∠ROS is 88°. What is the measure of ∠RSO,
in degrees?</td>
<td>46∘</td>
<td>44∘</td>
<td>0</td>
<td>2∘</td>
<td>0</td>
</tr>
<tr class="odd">
<td>25</td>
<td>F</td>
<td>26</td>
<td>−9x^2 + 30x + c = 0. In the given equation, c is a constant. The
equation has exactly one solution. What is the value of c? A) 3; B) 0;
C) −25; D) −53</td>
<td>C</td>
<td>C</td>
<td>1</td>
<td>A</td>
<td>0</td>
</tr>
<tr class="even">
<td>26</td>
<td>G</td>
<td>5</td>
<td><p>Hana deposited a fixed amount into her bank account each month.
The function f(t) = 100 + 25t gives the amount, in dollars, in Hana’s
bank account after t monthly deposits. What is the best interpretation
of 25 in this context?</p>
<p>A) With each monthly deposit, the amount in Hana’s bank account
increased by $25.</p>
<p>B) Before Hana made any monthly deposits, the amount in her bank
account was $25.</p>
<p>C) After 1 monthly deposit, the amount in Hana’s bank account was
$25.</p>
<p>D) Hana made a total of 25 monthly deposits.</p></td>
<td>A</td>
<td>A</td>
<td>1</td>
<td>A</td>
<td>1</td>
</tr>
<tr class="odd">
<td>27</td>
<td>G</td>
<td>17</td>
<td>For a certain rectangular region, the ratio of its length to its
width is 35 to 10. if the width of the rectangular region increases by 7
units, how must the length change to maintain this ratio?<br />
A) It must decrease by 24.5 units.<br />
B) It must increase by 24.5 units.<br />
C) It must decrease by 7 units.<br />
D) It must increase by 7 units.</td>
<td>B</td>
<td>B</td>
<td>1</td>
<td>No conclusion</td>
<td>0</td>
</tr>
<tr class="even">
<td>28</td>
<td>H</td>
<td>10</td>
<td>To estimate the proportion of a population that has a certain
characteristic, a random sample was selected from the population. Based
on the sample, it is estimated that the proportion of the population
that has the characteristic is 0.49, with an associated margin of error
of 0.04. Based on this estimate and margin of error, which of the
following is the most appropriate conclusion about the proportion of the
population that has the characteristic? A) It is plausible that the
proportion is between 0.45 and 0.53. B) It is plausible that the
proportion is less than 0.45. C) The proportion is exactly 0.49. D) It
is plausible that the proportion is greater than 0.53.</td>
<td>A</td>
<td>A</td>
<td>1</td>
<td>A</td>
<td>1</td>
</tr>
<tr class="odd">
<td>29</td>
<td>H</td>
<td>12</td>
<td>−4x^2 −7x=−36. What is the positive solution to the given equation?
A) 7/4; B) 9/4; C) 4; D) 7</td>
<td>B</td>
<td>B</td>
<td>1</td>
<td>7/4, or 1</td>
<td>0</td>
</tr>
<tr class="even">
<td>30</td>
<td>H</td>
<td>21</td>
<td>(-1)(x^2)+bx-676=0. In the given equation, b is a positive integer.
The equation has no real solution. What is the greatest possible value
of b?</td>
<td>51</td>
<td>51</td>
<td>1</td>
<td>51</td>
<td>1</td>
</tr>
<tr class="odd">
<td colspan="4">Total</td>
<td></td>
<td></td>
<td>26</td>
<td></td>
<td>17</td>
</tr>
</tbody>
</table>
