---
title: JavaScript Performance Wars
categories: [technology, javascript, performance, web-browser]
---

Is the difference between [Chrome][]'s [V8][] engine, and [WebKit][]'s [SquirrelFish Extreme][sfx] (SFX for short) significant enough that we need to care if we use Chrome or Safari/WebKit?

After some quick Googling for recent posts and comparisons of V8 and SFX, it seems nobody has bothered doing any comparisons after late 2008. Maybe I'm just completely outta the game, and the performance of the two engines is now common knowledge. If that's the case, it's knowledge I sure don't have.

I set out to do a quick (and unscientific) performance test between the latest released beta/development build of Chrome, and the latest WebKit nightly. I decided to use [SunSpider][] as it's still highly respected from what I know, and a test only takes 2-4 minutes instead of 15 minutes with [Dromaeo][]. For good measure I also threw in the latest [alpha build][opera] of Opera, and the latest shipping versions of Safari and Firefox.

## The Results

<p class="thumbs">
    <img src="http://files.jimeh.me/.blog/javascript_wars-20100219-195711.png" alt="SunSpider Results" />
</p>

I don't know about you, but a 4.6 ms difference between Chrome and WebKit is something I really don't care about. I don't even care about the 54.6 ms difference between Chrome and the latest shipping version of Safari. Specially not since I've been using WebKit nightlies the past 8 months with no more or less issues and/or crashes than with the standard Safari release.

Something that did grab my attention however was how well Opera 10.50 Alpha did with it's new [Carakan][] JavaScript engine. With that said, Carakan was eating about 80-90% CPU time during the tests, while all other browsers only used about 30%. Firefox's [TraceMonkey][] engine was unsurprisingly the slowest.

I'm looking forward to see what Opera does over the next couple of years with their desktop browser. Both in terms of performance, and in terms of page rendering. If you're following me on Twitter, you may know that from a web designer's point of view, I've had more issues and headaches with Firefox 3 lately than with Opera 10.

## Detailed Results

I ran all tests with a freshly relaunched browser, with no pages open aside from SunSpider. The test system was my 2007 MacBook Pro with a 2.4GHz Core 2 Duo processor and 4GB Ram running Mac OS X 10.6.2.

Below is a list of the specific browser versions I used, and the detailed SunSpider results.

* WebKit Nightly r54921 ([details][webkit-results])
* Chrome 5.0.322.2 dev ([details][chrome-results])
* Opera 10.50 Alpha ([details][operaa-results])
* Safari 4.0.4 ([details][safari-results])
* Firefox 3.6 ([details][firefox-results])

Don't take my findings too seriously however, cause I didn't have time to do multiple repetitive tests, rebooting the system between tests, or really much of anything to properly ensure the tests are 100% accurate. If you need seriously accurate numbers, run the tests yourself.


[v8]: http://code.google.com/p/v8/
[sfx]: http://webkit.org/blog/214/introducing-squirrelfish-extreme/
[carakan]: http://my.opera.com/core/blog/2009/12/22/carakan-revisited
[tracemonkey]: https://wiki.mozilla.org/JavaScript:TraceMonkey
[chrome]: http://www.google.com/chrome
[webkit]: http://nightly.webkit.org/
[sunspider]: http://www2.webkit.org/perf/sunspider-0.9/sunspider.html
[dromaeo]: http://dromaeo.com/
[opera]: http://my.opera.com/desktopteam/blog/2010/02/11/windows-beta-released-and-more

[webkit-results]: http://www2.webkit.org/perf/sunspider-0.9/sunspider-results.html?%7B%223d-cube%22:%5B19,19,19,18,18%5D,%223d-morph%22:%5B23,23,23,23,23%5D,%223d-raytrace%22:%5B20,20,20,18,18%5D,%22access-binary-trees%22:%5B6,6,5,5,8%5D,%22access-fannkuch%22:%5B21,20,20,20,20%5D,%22access-nbody%22:%5B17,16,15,15,15%5D,%22access-nsieve%22:%5B9,8,7,7,7%5D,%22bitops-3bit-bits-in-byte%22:%5B6,5,5,5,5%5D,%22bitops-bits-in-byte%22:%5B8,8,8,8,8%5D,%22bitops-bitwise-and%22:%5B5,6,5,7,8%5D,%22bitops-nsieve-bits%22:%5B13,15,11,11,11%5D,%22controlflow-recursive%22:%5B5,4,5,5,5%5D,%22crypto-aes%22:%5B15,14,15,14,14%5D,%22crypto-md5%22:%5B7,7,7,7,7%5D,%22crypto-sha1%22:%5B6,7,6,7,6%5D,%22date-format-tofte%22:%5B26,25,25,25,24%5D,%22date-format-xparb%22:%5B24,23,24,23,23%5D,%22math-cordic%22:%5B16,16,16,16,16%5D,%22math-partial-sums%22:%5B24,24,22,23,23%5D,%22math-spectral-norm%22:%5B9,9,10,9,8%5D,%22regexp-dna%22:%5B29,21,22,22,22%5D,%22string-base64%22:%5B19,17,17,18,19%5D,%22string-fasta%22:%5B18,26,26,30,27%5D,%22string-tagcloud%22:%5B38,36,36,36,36%5D,%22string-unpack-code%22:%5B56,56,55,54,55%5D,%22string-validate-input%22:%5B23,25,24,24,23%5D%7D
[chrome-results]: http://www2.webkit.org/perf/sunspider-0.9/sunspider-results.html?%7B%223d-cube%22:%5B34,25,31,22,21%5D,%223d-morph%22:%5B26,23,24,41,24%5D,%223d-raytrace%22:%5B21,19,17,33,21%5D,%22access-binary-trees%22:%5B2,2,2,7,2%5D,%22access-fannkuch%22:%5B16,14,15,18,16%5D,%22access-nbody%22:%5B19,18,18,20,18%5D,%22access-nsieve%22:%5B4,4,4,5,5%5D,%22bitops-3bit-bits-in-byte%22:%5B2,3,3,3,4%5D,%22bitops-bits-in-byte%22:%5B9,8,9,14,10%5D,%22bitops-bitwise-and%22:%5B9,9,9,9,10%5D,%22bitops-nsieve-bits%22:%5B10,13,11,16,11%5D,%22controlflow-recursive%22:%5B2,6,3,4,3%5D,%22crypto-aes%22:%5B9,11,10,19,10%5D,%22crypto-md5%22:%5B9,9,9,9,8%5D,%22crypto-sha1%22:%5B8,8,9,9,8%5D,%22date-format-tofte%22:%5B24,22,23,60,21%5D,%22date-format-xparb%22:%5B22,23,23,22,23%5D,%22math-cordic%22:%5B21,14,15,20,14%5D,%22math-partial-sums%22:%5B23,24,26,33,24%5D,%22math-spectral-norm%22:%5B8,7,10,10,8%5D,%22regexp-dna%22:%5B21,20,22,22,23%5D,%22string-base64%22:%5B14,13,14,20,14%5D,%22string-fasta%22:%5B17,20,17,21,17%5D,%22string-tagcloud%22:%5B41,40,39,54,39%5D,%22string-unpack-code%22:%5B49,49,51,52,47%5D,%22string-validate-input%22:%5B21,20,22,21,22%5D%7D
[operaa-results]: http://www2.webkit.org/perf/sunspider-0.9/sunspider-results.html?%7B%223d-cube%22:%5B19,17,19,17,16%5D,%223d-morph%22:%5B18,18,17,19,19%5D,%223d-raytrace%22:%5B22,22,21,22,21%5D,%22access-binary-trees%22:%5B6,7,6,6,7%5D,%22access-fannkuch%22:%5B19,19,18,20,19%5D,%22access-nbody%22:%5B13,12,12,14,14%5D,%22access-nsieve%22:%5B6,6,8,7,6%5D,%22bitops-3bit-bits-in-byte%22:%5B2,1,2,2,2%5D,%22bitops-bits-in-byte%22:%5B2,2,3,3,2%5D,%22bitops-bitwise-and%22:%5B2,2,2,3,3%5D,%22bitops-nsieve-bits%22:%5B9,9,9,9,10%5D,%22controlflow-recursive%22:%5B4,4,6,5,5%5D,%22crypto-aes%22:%5B18,18,17,17,19%5D,%22crypto-md5%22:%5B7,6,6,6,6%5D,%22crypto-sha1%22:%5B4,3,4,4,5%5D,%22date-format-tofte%22:%5B37,32,32,33,31%5D,%22date-format-xparb%22:%5B40,39,39,42,42%5D,%22math-cordic%22:%5B9,9,8,9,9%5D,%22math-partial-sums%22:%5B17,16,18,17,19%5D,%22math-spectral-norm%22:%5B5,6,6,6,7%5D,%22regexp-dna%22:%5B16,16,16,17,18%5D,%22string-base64%22:%5B21,20,21,21,21%5D,%22string-fasta%22:%5B28,27,30,27,32%5D,%22string-tagcloud%22:%5B53,53,56,50,55%5D,%22string-unpack-code%22:%5B39,42,37,41,41%5D,%22string-validate-input%22:%5B39,41,40,44,44%5D%7D
[safari-results]: http://www2.webkit.org/perf/sunspider-0.9/sunspider-results.html?%7B%223d-cube%22:%5B19,17,18,19,21%5D,%223d-morph%22:%5B26,24,25,24,25%5D,%223d-raytrace%22:%5B20,21,21,21,22%5D,%22access-binary-trees%22:%5B6,6,7,6,6%5D,%22access-fannkuch%22:%5B22,23,22,22,21%5D,%22access-nbody%22:%5B15,16,15,15,15%5D,%22access-nsieve%22:%5B12,11,10,10,10%5D,%22bitops-3bit-bits-in-byte%22:%5B5,5,7,5,5%5D,%22bitops-bits-in-byte%22:%5B10,9,9,8,8%5D,%22bitops-bitwise-and%22:%5B6,7,8,10,7%5D,%22bitops-nsieve-bits%22:%5B13,11,11,11,11%5D,%22controlflow-recursive%22:%5B5,4,7,5,6%5D,%22crypto-aes%22:%5B16,16,19,17,17%5D,%22crypto-md5%22:%5B8,9,11,8,8%5D,%22crypto-sha1%22:%5B7,7,8,7,7%5D,%22date-format-tofte%22:%5B29,29,29,29,31%5D,%22date-format-xparb%22:%5B36,37,38,36,38%5D,%22math-cordic%22:%5B15,15,15,17,14%5D,%22math-partial-sums%22:%5B23,23,23,23,25%5D,%22math-spectral-norm%22:%5B9,9,9,11,9%5D,%22regexp-dna%22:%5B24,23,23,21,24%5D,%22string-base64%22:%5B20,20,21,20,20%5D,%22string-fasta%22:%5B36,37,37,36,36%5D,%22string-tagcloud%22:%5B39,40,39,39,47%5D,%22string-unpack-code%22:%5B53,52,52,52,53%5D,%22string-validate-input%22:%5B34,34,36,35,35%5D%7D
[firefox-results]: http://www2.webkit.org/perf/sunspider-0.9/sunspider-results.html?%7B%223d-cube%22:%5B49,47,48,48,47%5D,%223d-morph%22:%5B27,29,29,29,28%5D,%223d-raytrace%22:%5B69,66,70,70,68%5D,%22access-binary-trees%22:%5B43,43,49,46,44%5D,%22access-fannkuch%22:%5B63,62,63,67,66%5D,%22access-nbody%22:%5B28,34,31,31,29%5D,%22access-nsieve%22:%5B12,13,12,12,13%5D,%22bitops-3bit-bits-in-byte%22:%5B1,1,1,2,1%5D,%22bitops-bits-in-byte%22:%5B9,11,10,11,11%5D,%22bitops-bitwise-and%22:%5B3,3,2,2,3%5D,%22bitops-nsieve-bits%22:%5B25,26,25,24,23%5D,%22controlflow-recursive%22:%5B34,34,34,34,34%5D,%22crypto-aes%22:%5B32,35,31,33,33%5D,%22crypto-md5%22:%5B15,14,14,24,15%5D,%22crypto-sha1%22:%5B8,11,8,9,9%5D,%22date-format-tofte%22:%5B87,88,90,88,88%5D,%22date-format-xparb%22:%5B60,59,58,59,58%5D,%22math-cordic%22:%5B10,10,10,10,9%5D,%22math-partial-sums%22:%5B17,16,16,16,16%5D,%22math-spectral-norm%22:%5B6,6,7,6,7%5D,%22regexp-dna%22:%5B59,59,60,62,62%5D,%22string-base64%22:%5B12,12,12,16,13%5D,%22string-fasta%22:%5B76,77,76,78,78%5D,%22string-tagcloud%22:%5B98,99,100,99,99%5D,%22string-unpack-code%22:%5B110,109,110,110,111%5D,%22string-validate-input%22:%5B32,32,32,31,30%5D%7D
