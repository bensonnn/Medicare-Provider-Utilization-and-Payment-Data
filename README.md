#README

###<a href="http://med-data.herokuapp.com">med-data.herokuapp.com</a><br />
This is project based on <a href="http://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Physician-and-Other-Supplier.html">Medicare-Provider-Supplier Data</a> supplied by CMS.gov.

###What This Is
I compiled Medicare Data for 14,000 Zip codes, then filled the Zip Code areas on a US map with opacities corresponding to higher average standard deviations of different data points.    

###Challenges
This was a large dataset from my expierence and really pushed my optimization techniques for Rails.  Though I wasn't able to use the whole file, I was used about a million lines of the data to speed up my workflow.  

The data itself was pretty straightforward, but before building the heat map, I had no idea what would be uncovered.  I also wasn’t sure how I could make this data interactive.  This rendering was more of a gamble than an educated guess.  Moving forward, I need to approach data in a more scientific way. 
