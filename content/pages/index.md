Title: SSOScan
Date: 2015-08-03
Save_as: index.html

## Automatic Scanning for SSO Vulnerabilities

SSOScan is a tool that can automatically check if your application has
[these vulnerabilities](|filename|./vulnerabilities.md) when integrating
Facebook Single Sign-On (SSO).

<center>
<iframe width="560" height="315"
        src="//www.youtube-nocookie.com/embed/biO-nzyItZw"
        frameborder="0" allowfullscreen></iframe>
</center>

Correctly integrating third-party services into web applications is
challenging, and mistakes can have grave consequences when third-party
services are used for security-critical tasks such as authentication and
authorization. Developers often misunderstand integration requirements
and make critical mistakes when integrating services such as single
sign-on APIs. Since traditional programming techniques are hard to apply
to programs running inside black-box web servers, we propose to detect
vulnerabilities by probing behaviors of the system. This paper describes
the design and implementation of SSOScan, an automatic vulnerability
checker for applications using Facebook Single Sign-On (SSO) APIs. We
used SSOScan to study the twenty thousand top-ranked websites for five
SSO vulnerabilities. Of the 1660 sites in our study that employ Facebook
SSO, over 20% were found to suffer from at least one serious
vulnerability.

<center>
<a href="/images/systemStructure.png"><img src="/images/systemStructure-small.png" width=500 height=264 alt="System Strcture"></a>
</center>

[Vulnerabilities Checked by SSOScan](|filename|./vulnerabilities.md)

### Paper

Yuchen Zhou and David Evans. _SSOScan: Automated Testing of Web Applications for Single Sign-On Vulnerabilities_ in [_23<sup>rd</sup> USENIX Security Symposium_](https://www.usenix.org/conference/usenixsecurity14), San Diego, 20-22 August 2014.

Full paper (16 pages): [[PDF](|filename|../docs/SSOScan.pdf)]
Expanded tech report (18 pages): [[PDF](|filename|../docs/SSOScan_TR.pdf)]

### Source Code

[http://www.github.com/Treeeater/vulCheckerFirefox](http://www.github.com/Treeeater/vulCheckerFirefox)

