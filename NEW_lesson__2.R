#options(download.file.method="libcurl")

#install.packages("cluster")
library(cluster)
library(dplyr)


data()
?votes.repub
head(votes.repub)
str(votes.repub)


dim(votes.repub)

votes.repub[1:6,1:10]

colMeans(votes.repub)

colMeans(votes.repub, na.rm=TRUE)

# � 30-� ������� ��� ����������� ��������

votes.repub[,30]

if(mean(votes.repub[,30])>60){
  print("������������� ������� ������� ������� �������")
}else{
  print("������������� ������� ����� 60% �������")
}


# � 7-� ������� ���� ����������� ��������

if(mean(votes.repub[,7], na.rm = TRUE)>60){
  print("������������� ������� ������� ������ �������")
} else{
  print("������������� ������� ����� 60% �������")
}

?ifelse()

x<-c(3,0,0,0,1,0)
x
ifelse(x!=0,"Yes","No")

#� ��� ������ ,���� ������� �������� ���� �������, �������� �� ��������������,
#�� ������ ����� 60, ����� ���������� ��������� : "������������� ������� ����� 60% �������",
#� ��������� ������ "������������� ������� ����� 60% �������"

ifelse(colMeans(votes.repub,na.rm = TRUE)>60, 
       "������������� ������� ������� ������� �������","������������� ������� ����� 60% �������")

# �������� ����� ����� ������ �������� �������,������� �� �������, �� ����� ����� ������� ����� �� ������������ ����
#����� �� ����������� � ������� lubridate, ���������������� ��� ������ � ������
# ������������� ������� �dat� ,����������� ������ � �������� � ������ ��� 2018 ���� 
# �� �������� ���������� ������� ����������,��� ����� ������ ���� sESSION->SET WORKING DIRECTORY->CHOOSE DIRECTORY

getwd()

dat<-read.csv("datn.csv")
#X -  ����� �������
# d.date � ���-�����-����
#ball � ��������� ���� ����������� �� ������, � ����� �������������� �� 3 � 5 �����
#price � ����
head(dat)
dim(dat)
str(dat)
dat$d.date
levels(dat$d.date)
unique(dat$ball)
unique(dat$price)
dim(dat)
datn<-dat[,-1]
datn
head(datn,10)
str(datn)
unique(datn$ball)
unique(dat$price)

#install.packages("lubridate")
library(lubridate)
?lubridate
class(datn$d.date)
datn$d.date

dayn<-ymd(datn$d.date)
class(dayn)
dayn
year(dayn)
month(dayn)
day(dayn)

datn$price
datn$price[day(ymd(datn$d.date))==1]
sum(datn$price[day(ymd(datn$d.date))==1])

f.1<-function(d){
  sum(datn$price[day(ymd(datn$d.date))==d])
}

f.1(3)

f.1<-function(d){
  t<-sum(datn$price[day(ymd(datn$d.date))==d]) #����� ���������� �������� return(t)
  return(t)  
  }
  
f.1(3)

sum(f.1(1),f.1(2),f.1(3))
sum(datn$price)

#������� �������, ������� �� ����������� �������, �� ��� ����� ��� ������ �����

f.2<-function(m,d){sum(datn$price[month(ymd(datn$d.date))==m & day(ymd(datn$d.date))==d])}
f.2(1,1)
f.2(1,3)
#������� ������ � ������ ������ ���
f.2(2,1)

# ��������� ������� �������� �� ����. ��� ����� ����������� ���� for
f.1(1)
f.1(2)

for(i in 1:3){
  print(f.1(i))
}
# ���������� ������� lapply() , sapply()

head(votes.repub)
?apply
class(votes.repub)

(apply(votes.repub,1,mean))

?lapply
lapply(votes.repub,sum)

class(unlist(lapply(votes.repub,sum)))
as.numeric(unlist(lapply(votes.repub,sum)))

sapply(votes.repub,sum)

class(sapply(votes.repub,sum))


## ������� tapply() �������� ������ ������� � �������
#��� ��� p������� ����� �������� �� ������� ���� ���� "Orange"
data()
head(Orange,12) # ���������� ���������� � ���������� ��������
?Orange
#����� �������� ��� ����������:
# - ����� ������;
# - ������� ������ � 31.12.1968, � ����;
# - ����� ���������� ������.

#������� �������, ������� ����� ������� �� ������� ���������� ��������� ������ � 
# ������ ���� ������(118-�� ����) �� ��������� ���� (1582 ����)
# ������, ������ ������� range(), diff()
a<- c(1,2,3,5,8)

diff(a)

range(a)
min(a)
max(a)
diff(a)
diff(range(a))
l<-function(x){diff(range(x))} 
l(a)
?tapply

tapply(Orange$circumference,Orange$Tree,l) # 1,2 ��������� ������� ������ ���� ���������� �����,
                                           #1-� -��� ��,��� ��������� �� ���������,2-�- ������
###
search()
install.packages("effectsize")



z<-c(1,2,3,4)
v<-c(0,82,2,8)
z%in%v

#��������� ����� ������ � ������� csv

a<-c(1,2,3)
b<-c(0,0,0)
nm<-paste0(seq(1,3),"_","row")
nm
df.1<-data.frame(a,b, row.names = nm)
df.1
write.csv(df.1,file = "november.csv")
getwd()
df<-read.csv2("november.csv")
class(df)
read.csv("cardio_train.csv")
head(read.csv("cardio_train.csv"))
head(read.csv("cardio_train.csv",sep=";"))
read.csv("cardio_train.csv",sep=";",nrow=5,row.names = paste0("row",seq(1,5))) #������� ����� ����� ���������� ������ ��� ������
read.csv("cardio_train.csv",sep=";",nrow=5,row.names = paste0("row",seq(1,5)))# � �������� ���� ����� ����� � ������� �����
read.csv("cardio_train.csv",sep=";",nrow=5,row.names = paste0("row",seq(1,5)), header= FALSE)
# �������� ����� ��� ������ ������ � ������ excel

install.packages("readxls")
library(readxl)
read_xls("book_1.xls")

library(rio)
?rio
#������� ������� ������� � ������� ������ "���"
head(import("cardio_train.csv"))
import("book_1.xls")
read.csv("book_1.xls") # ������!  ��� ������� �� ��������� ������ ������
