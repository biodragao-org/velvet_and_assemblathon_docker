FROM conda/miniconda2-centos7
MAINTAINER Abhinav Sharma (@abhi18av)

#########
### Commands
#########
RUN     conda config --add channels defaults
RUN     conda config --add channels bioconda
RUN     conda config --add channels conda-forge
# setup velvet

RUN 	conda install velvet -y

# setup assemblathon_stats.pl

RUN     yum install perl -y

RUN     curl -LJ0 https://raw.githubusercontent.com/ucdavis-bioinformatics/assemblathon2-analysis/master/FAlite.pm -O
RUN     curl -LJ0 https://raw.githubusercontent.com/ucdavis-bioinformatics/assemblathon2-analysis/master/assemblathon_stats.pl -O

RUN     chmod +x assemblathon_stats.pl && \
	cp FAlite.pm /usr/share/perl5/ && \
	cp assemblathon_stats.pl /usr/local/bin/



