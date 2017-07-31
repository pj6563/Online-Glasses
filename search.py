from urllib.request import urlopen
from bs4 import BeautifulSoup
import re

#크롤링 시작 페이지 지정
search_page="http://cslab2.kku.ac.kr/~sunwoo"

search_list=[]
search_list.append(search_page)
img_list = []

print('-'*20)
error = 0
out = 0

# 탐색 주소에 저장된 리스트 출력(순회에 필요)
for link_search in search_list :
    
    if link_search == None : break
    
    #횟수 제한
    out += 1
    if out > 100 :
        break
    
    try :   
#        print("check page  ="+link_search)
        html = urlopen(link_search)
        bsObj = BeautifulSoup(html, "html.parser")

        print(link_search)
        soup = str(bsObj.text)

        #라인단위로 끊어서 찾기
        for line in soup.split("\n"):
            word_result = []
#            print ("test line = "+line)
            if re.search('신청 ?기간',line) != None :
                print(line) 
                print(link_search) 
            if re.search('신청 ?방법',line) != None :
                print(line)
            if re.search('성적 ?기준',line) != None :
                print(line)
            if re.search('관련 ?문의',line) != None :
                print(line)
            if re.search('신청 ?대상',line) != None :
                print(line)
            if re.search('신청 ?자격',line) != None :
                print(line)
            if re.search('신청 ?문의',line) != None :
                print(line)
            if re.search('지원 ?내역',line) != None :
                print(line)
            
    except (IndexError, ValueError,IOError):
        error += 1
        
    
#이미지 추출
    for link_img in bsObj.find_all('img'):
        smae = 0
        for check_img in link_img:
            if check_img == link_img.get('src') :
                same += 1
                break

        if same == 0 :
            img_list.append(link_img.get('src'))
        
#---------------------- frame으로 설정된 페이지 이름  추출
    for link_src in bsObj.find_all('frame'):

        chang_str =str(link_src.get('src'))

        #리스트 중복 여부 테스트
        same = 0
        
        for check_adress in search_list :
            if check_adress == link_src.get('src') :
                same += 1
                break
            
        if same == 0 :
                       
            if chang_str.startswith("https") == True:
                search_list.append(link_src.get('src'))
    #/로 시작하는 기본주소가 포함되지 않은 주소
            elif chang_str.startswith("/") == True:
                search_list.append(link_search+link_src.get('src'))
                
            elif chang_str.endswith('com') or chang_str.endswith('net') ==True :
                break
    #기본 주소가 포함 되지 않은 주소
            else :
                  search_list.append(link_search+'/'+link_src.get('src'))


# ----------------------------a 태그로 설정된 주소 추출
    for link_href in bsObj.find_all('a'):

    
        
        chang_str =str(link_href.get('href'))

#리스트 중복 여부 테스트
        same = 0
        
        for check_adress in search_list :
            if check_adress == link_href.get('href') :
                same += 1
                break
        if same == 0 :
                        
            
                #기본 주소가 포함된 주소
            if chang_str.startswith("http") == True:
                search_list.append(link_href.get('href'))
                #/로 시작하는 기본주소가 포함되지 않은 주소
            elif chang_str.startswith('/') == True:
                search_list.append(link_search+link_href.get('href'))
            elif chang_str.endswith('com') or chang_str.endswith('net') ==True :
                break
    #기본 주소가 포함 되지 않은 주소
#            else :
#               search_list.append(link_search+'/'+link_src.get('href'))


# ----------------------------------link 태그로 설정된 주소 추출
    for link_link in bsObj.find_all('link'):

        chang_str =str(link_href.get('href'))

       #리스트 중복 여부 테스트
        same = 0
        
        for check_adress in search_list :
            if check_adress == link_href.get('href') :
                same += 1
                break
        if same == 0 :
                
                
                #기본 주소가 포함된 주소
            if chang_str.startswith("http") == True:
                search_list.append(link_href.get('href'))
                #/로 시작하는 기본주소가 포함되지 않은 주소
            elif chang_str.startswith('/') == True:
                search_list.append(link_search+link_href.get('href'))
            elif chang_str.endswith('com') or chang_str.endswith('net')   ==True :
                break
                
                #기본 주소가 포함 되지 않은 주소
#            else :
#                search_list.append(link_search+'/'+link_href.get('href'))
                
    
# p 태그안의 텍스트만 읽어오기
  #  for show_p in bsObj.find_all('p'):
        
        #해당 show_p 값에 해당 문자가 들어있는지 확인 후 끝지점 부터 다음 단어 전까지
   #     textget = show_p.get_text()
    #    if textget.compile('b') >= 1 :
     #       print('test')




