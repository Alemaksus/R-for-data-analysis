getwd() # Getting work directory
x_1 <- c(1,2,3)

x_1

rm(x_1) # Deleting (remove) of an object
x_1

x[1:8] # Sequence

## Objects:

x.1 <- 17 # variable
x.1
rm(x.1) # delete X.1

# Base functions:

1+6
1-6
10/2
10:2
10*2
10^2
sqrt(25)
log2(8)

help(log)

log(27, base = 3)
log(27,3)

factorial(5)

## function work

sqrt(log2(16))

## available packages: https://cran.r-projects.org/

## objects part2:
a<-c(0,1,2,3)
a
a[4]
b<-rep(2,3) # deuce is repeated two times
b
?rep # ? - help for functions

seq(2,8,by=2) #generation of evens
seq(1,9,by=2) # ... of odds
?seq
seq(1,10, length.out = 5)
seq(1,10, by = 2.25)

s<-1:10
s
s<-10:1
s

set.seed(1)
rnorm(n=50,mean=0,sd=1) # set the normal distribution

rpois(100, 10) # Poisson distribution
?rpois

set.seed(1)
rbinom(100,10,0.5) # binomial distribution

rep(c(0,2),time=2) # vector creation
c
rep(c(0,2),each=2)
c

# text vectors:

letters # object 'alphabet'
LETTERS # objest 'ALPHABET'
?paste # concatenate strings
paste(letters, set="_",seq(1,26))

paste0(letters, set="_",seq(1,26))


?ISOdate

format(ISOdate(2019,9,1:30),"%d")
format(ISOdate(2019,9,1:30),"%A")

paste (format(ISOdate(2019,9,1:30),"%d"),set="_",format(ISOdate(2019,9,1:30),"%b"))

paste (format(ISOdate(2019,9,1:30),"%d"),set="_",rep("сен",time=30))

class(a) # type of the object a ('numeric")

b<-letters
class(b)
class(2!=0)
class(factorial)

d<-c(rep('a', 4), rep('b', 6), rep('c', 2))
d
sample(d) # shuffles the vector "d"

d.table<-table(d) # creation of d.table
class(d.table)

d.table

r<- seq(10, 1) # creation of decreasing sequence from 10 to 1.
r
sum(r)

mean.1<-sum(r)/length(r)
mean.1

mean.2<-mean(r) # built in function 'mean'
mean.2

set.seed(1)
popul<-rnorm(100) # making of normal distribution
popul


popul.1<-round(popul, 3)
popul.1

sort(popul.1) # increasing sorting
sort(popul.1,decreasing=TRUE) # decreasing sorting

set.seed(1)
lets<- sample(letters, 100, replace = TRUE)
lets

# Creating of data frame:
df<-data.frame(lets, popul.1)
head(df) # show the first 6 elements of the data frame

# needs to be placed in ascending order, 
# but now a letter also corresponds to each value
ind<-order(df$popul.1) # ordering of the column 'popul.1'
ind

df.new<-df[ind,]
head(df.new,10)

# some other operations with vectors:

g<-seq(31,45)
g
length(g) # it's the length of the vector 'g'
g[1] # it's returning of value (31) by index (1)
g[c(1, 5, 15)] # take several elements by indexes
g[-c(1, 5, 15)] # take all without several elements shown in indexes

## other functions
# training datasets:

data(package = .packages(all.available = TRUE)) # R data sets
search()

install.packages("cluster")
library(cluster)

animals
?animals

is.na(animals) # checking of N/A elements in data set
sum(is.na(animals))

head(animals, 3)

animals$gro
animals$gro[!is.na(animals$gro)] # taking elements without N/A
animals$gro[!is.na(animals[,5])] # the same but with slice at the 5th column (gro)

head(iris, 10)
tail(iris)
dim(iris)
str(iris)

unique(iris$Species)
levels(iris$Species)
iris[1,1]

traindat<-iris[1:5, c(2,3,5)]
traindat
traindat[traindat$Sepal.Width>3,]

traindat[traindat$Sepal.Width>3 & traindat$Petal.Length>1.4,]

## Building of data set

weight<- c(78, 56, 67, 48, 69, 90)
height<- c(170, 160, 165, 159, 170, 185)
sex<- c(rep("F", 3), rep("M", 3))
sex
class(sex)

df.1<- data.frame(weight, height, sex, stringsAsFactors = F)
df.1
str(df.1) # structure of our data frame

df.2<- data.frame(weight, height, sex, stringsAsFactors = T)
df.2
str(df.2)

unique(sex)
factor(sex)
levels(factor(sex))

# how to build a matrix:

m<- 1:30 # This is a subsequence
m
dim(m)

z<-c(10,3)
z

dim(m)<-z # set the volume
m
class(m)

# 2nd varian for building a matrix:

y<- 1:50
y

mt<-matrix(y,10,5)
mt

imena<- LETTERS[1:10]
imena

cbind(imena,mt)

rownames(mt)
colnames(mt)

rownames(mt,do.NULL = T, prefix = "row")
rownames(mt)<-imena
mt

colnames(mt,do.NULL = TRUE, prefix = "col")
colnames(mt)<- paste0("day", 1:5)
mt
mt[,2]
mt[2,]