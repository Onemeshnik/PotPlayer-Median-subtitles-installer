# SuperSVP support vk.com/potplayerms t.me/supersvp
Try{ Core=Core }catch(err){ 
FPS= 36 			GPU= 0		MaskArtefact = 0		#FPS: 1..10 - 1..10X,>10 - target FPS. You can proportionally (targeFPS-originalFPS) decrease CPU load reducing this value. GPU 0 - off | 1(11) - 1st GPU on 1st platform | 12 - 2nd GPU on 1st platform | 21 - 1st GPU on 2nd platform...
Radius= 0 		BadLev= 0 	BlockSize = 0		#0-3  0-weakest, 3 - best. As I know, usually in original SVP BadLev=Radius , but you can control it manually #MaskArtefact 0 - default, 50 - middle, 200 - strong. Bigger values gives less smoothing; BlockSize 0-8, 0-w32, ol0; 1-w32,ol1; 2-w32; 3-ol; 4-ol1; 5-default 16,ol2; 6-w8,ol0; 7-w8,ol1; 8-w8 . Bigger block faster and less noisy, but small have better smooth.
Pel= 1			Thsad= 66		Mode= 1			#pel 2 is default, higher is slower. The accuracy of the motion estimation. 1 means a precision to the pixel, 2 means a precision to half a pixel, 4 - to quarter pixel (not recommended to use). But Pel=1 is Okay #thsad:200, default, 250 for better quality, 1000 for smooth animation, 65000 for... I do not know, but it used some time ago. Zero means "do not refine, just divide" #mode 1 - ������ ���� ���� ������������ ���� ���, ��������� - ��������� �����, 0 - �� ���� ���� ������ ������� ����, ��������� ��������� (���������, �����?! ���� ���������� ���� � ��� �������� �� ���), 2 - ������ ���� ���� ����������� (�����?! �� ������ ���� ����������, �������� �� ��� ������ ��������),  3 - �� �������� (������), ������ ��� �������� ��� 0. � �������, ��� � ������� ������ ����� ���� �������� ������� � 2 �����, �� ����� �� ������ � �������?! 	
CoarseWidth= 66		WeakGPU= 0	SearchDistance= 66  	#default 1050, higher is slower #WeakGPU if your GPU is overload, 1 means linear:false, 2 - cubic:0; 3 - cubic:0,linear:false . In modern version if SVP decides thay you have weak GPU, it paste only linear:false. Cubic:0 is for previous versions #SearchDistance:0 speeds up, but can looks good on GPU. Developers do not use it in script generator
CoarseType=66		SearchType=2
Algo= 13			Tthreads = 66	 			#13  algo for movies, 2 for animation. There is other algos, but they works bad, imho
OSD= 2			FontColor= $44FFFF00			#OSD=0..2 0 disables messages, 1 shows message OSDtimesec seconds, 2 shows them permanently $8800FFFF		
FontSize= 40		Font="Segoe UI Light"
SuOR=""								#like {scale:{up:0},gpu:1}
AnOR=""
SmOR=""
BlockPercent=66
wtf1="" wtf2="" wtf3=""
#vectors= 3 #2 loads gpu less, but worse quality

SetMemoryMax(2700)
PPcheck=1#WIDTH
PPcheck==1? eval ("""
SetFilterMTMode("ffdshow_source",3)
ffdshow_source()
ConvertToYV12()
global threads=4 #for regular player
""") : eval ("""
global threads=GPU==1? round(1.823 * #CPUS) : #CPUS+1 #valid only for PotPlayer. You can calculate and input numbers of CPU Cores*2 manually
SetFilterMTMode("potplayer_source",3)
potplayer_source()
#ConvertToYV12()
""")}

#WTF2=FontColor<$10000? "menwe" : "bolwe"

UseCoarseW= CoarseWidth==66? "" : "width:"+String(CoarseWidth)+","
UseSearchDistance= SearchDistance==66? "" : "distance:"+String(SearchDistance)+"," 
UseCoarseType= CoarseType==66? "" : "type:"+String(CoarseType)+"," 
UseSearchType= SearchType==66? 2 : SearchType
global threads= tthreads == 66 ? threads : tthreads >100 ? threads+tthreads-100 : tthreads >0 ? tthreads : tthreads<0 ? threads + tthreads : threads

orignum=FrameRateNumerator
origdenom=FrameRateDenominator

UseBlockPercent=BlockPercent==66? "":",blocks:"+String(BlockPercent)+""

bit=GetProcessInfo()
Try{LoadPlugin(""+String(bit)+"\svpflow1.dll")
LoadPlugin(""+String(bit)+"\svpflow2.dll")}
catch(err){LoadPlugin("AviSynth\"+String(bit)+"\svpflow1.dll")
LoadPlugin("AviSynth\"+String(bit)+"\svpflow2.dll")}


#LoadPlugin("C:\Program Files (x86)\SVP 4\plugins\svpflow1.dll")
#LoadPlugin("C:\Program Files (x86)\SVP 4\plugins\svpflow2.dll")
#LoadPlugin("C:\Program Files (x86)\SVP 4\plugins64\svpflow1.dll")
#LoadPlugin("C:\Program Files (x86)\SVP 4\plugins64\svpflow2.dll")
SetFilterMTMode("DEFAULT_MT_MODE",2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)

denum=10000
origframerate=framerate
num=ceil(float(FPS)*denum/Framerate)
framerate>40?eval("""num=1 denum=1""") : ""
FPS <= 10 ? eval("""rate = "num:"+String(FPS)+"" denum=1 num=FPS """) : eval(""" rate = "num:"+String(num)+",den:"+String(denum)+"" """)

weakgpuparam= WeakGPU==1? "linear:false," : WeakGPU==2? "cubic:0," : WeakGPU==3? "linear:false,cubic:0," : ""
gpuid = (gpu>1) ? "gpuid:"+String(gpu)+"," : ""

RadiusType = Floor(Radius % 2) == 1 ? "type:2," : ""
TrueRadius = -6-2*((Radius + 1) / 2-1)

Radius == 0 ? eval("""
AnalyseMainSearchCoarse="satd:false,"
""") : Radius >= 1 ? eval("""
AnalyseMainSearchCoarse=""+RadiusType+"distance:"+String(TrueRadius)+","
""") : Radius == -1 ? eval("""
AnalyseMainSearchCoarse="distance:-8,"#okay...
SuOR=""#like {scale:{up:0},pel:1,gpu:1}
AnOR="{block:{w:32,overlap:0},main:{search:{type:2,distance:0,coarse:{width:530,type:2,distance:-1,satd:false,bad:{range:0}}},refine:[{thsad:200,search:{type:2,distance:0}}]}}}"
SmOR=""
""")  : Radius == -2 ? eval("""
AnalyseMainSearchCoarse="distance:-8,"#okay...
SuOR="{scale:{up:0,down:2},gpu:1,pel:1,full:false}"#like {scale:{up:0},gpu:1}
AnOR="{block:{w:32,overlap:0},main:{search:{type:2,distance:0,coarse:{width:530,type:2,distance:-1,satd:false,bad:{range:0}}},refine:[{thsad:0,search:{type:2,distance:0}}]}}}"
SmOR=""
""") : eval ("""
AnalyseMainSearchCoarse="distance:-12,"
""")

AnalyseMainBadLev=""

BadRange= floor(BadLev) % 2 == 1 ? "" : ",range:24"
BadSad=(floor(BadLev)/2+1)*1000+Round(BadLev*1000)%1000
#wtf3=String(BadSad)
BadLev == 0 ? eval("""
AnalyseMainBadLev="range:0"
""") : BadLev == 1 ? eval("""
""") : BadLev > 1 ? eval("""
AnalyseMainBadLev="sad:"+String(BadSad)+""+String(BadRange)+""
""") : eval ("""
AnalyseMainBadLev="sad:2000"
""")

/*BadLev == 0 ? eval("""
AnalyseMainBadLev="range:0"
""") : BadLev == 1 ? eval("""
AnalyseMainBadLev="range:24"
""") : BadLev == 2 ? eval("""
AnalyseMainBadLev="sad:2000,range:24"
""") : eval ("""
AnalyseMainBadLev="sad:2000,range:24"
""")*/ #i was wrong

pel < 2 ? eval("""
pelparams="pel:1,full:false"
""") : eval("""
pelparams="pel:"+String(pel)+""
""")
AnalyseBlock = BlockSize==0 ? "block:{w:32,overlap:0}," : BlockSize==1 ? "block:{w:32,overlap:1}," : BlockSize==2 ? "block:{w:32}," : BlockSize==3 ? "block:{overlap:0}," : BlockSize==4 ? "block:{overlap:1}," : BlockSize==5 ? "block:{}," : BlockSize==6 ? "block:{w:8,overlap:0}," : BlockSize==7 ? "block:{w:8,overlap:1}," : BlockSize==8 ? "block:{w:8}," : "block:{}," 
BlockSizePx = BlockSize==0 ? "32" : BlockSize==1 ? "28" : BlockSize==2 ? "24" : BlockSize==3 ? "16" : BlockSize==4 ? "14" : BlockSize==5 ? "12" : BlockSize==6 ? "8" : BlockSize==7 ? "7" : BlockSize==8 ? "6" : "12" 

gpuparams = gpu>0 ? "scale:{up:0},gpu:1" : "scale:{up:2},gpu:0"

#MultiplerW=width/DisplayW
#MultiplerH=height/DisplayH
##width*height<DisplayW*DisplayW? OverrideRes=0 : OverrideRes=1
#OverrideRes==1?eval(""" """)
#MultiplerW>MultiplerH? cropstring="width/MultiplerW,height/MultiplerH,c=0.75":cropstring=""
UseThsad=Thsad==66?"":"thsad:"+String(Thsad)+","
UseMaskArtefact=MaskArtefact==0? "" : "area:"+String(MaskArtefact)+""
global source_width = width
global source_height = height
global crop_string  = ""
global resize_string = ""#BicubicResize(1366,768,b=0,c=0.75)"
global super_params     = SuOR=="" ? "{"+gpuparams+","+pelparams+"}" : SuOR
#global analyse_params   = "{"+AnalyseBlock+"main:{search:{type:2,"+SearchDistance+"coarse:{"+CoarseWidth+""+AnalyseMainSearchCoarse+" bad:{"+AnalyseMainBadLev+"}}},refine:[{"+thsad+"}]}}}"
part1="{"+AnalyseBlock+"main:{search:{"+UseSearchDistance+"coarse:{"+UseCoarseType+""+UseCoarseW+""+AnalyseMainSearchCoarse+""
part2="bad:{"+AnalyseMainBadLev+"}},type:"+String(UseSearchType)+"}},refine:[{"+UseThsad+"search:{}}]}"
global analyse_params = AnOR == "" ? ""+part1+""+part2+"" :  AnOR
usemode= mode==3 ? "3,limits:{"+UseBlockPercent+"}" :  mode==4 ? "3,limits:{m1:0,m2:0"+UseBlockPercent+"}" : mode==5? "3,limits:{m1:0"+UseBlockPercent+"}" : mode
global smoothFPS_params = SmOR=="" ? "{"+weakgpuparam+"rate:{"+rate+"},"+gpuid+"algo:"+String(algo)+",mask:{"+String(UseMaskArtefact)+"},scene:{mode:"+String(usemode)+"}}" : SmOR

global demo_Mode=0
global stereo_type=0

########## BEGIN OF base.avs ##########
# This file is a part of SmoothVideo Project (SVP) ver.4
# This is NOT the full AVS script, all used variables are defined via
# JScript code that generates the full script text.


NewWidth = 1366
NewHeight = 768
SourceAspect = float(source_width) / float(source_height)
MyAspect = float(NewWidth) / float(NewHeight)
SourceAspect > MyAspect ? eval("""
ResizedWidth=NewWidth
ResizedHeight=round(float(source_height) * float(NewWidth) / float(source_width) / 2.0) * 2
""") : eval("""
ResizedHeight=NewHeight
ResizedWidth=round(float(source_width) * float(NewHeight) / float(source_height) / 2.0  ) * 2
""")
#resize_string="BicubicResize("+String(ResizedWidth)+","+String(ResizedHeight)+",b=0,c=0.75)"

function interpolate(clip src)
{
	input = crop_string=="" ? src : eval("src."+crop_string)
	input = resize_string=="" ? input : eval("input."+resize_string)

	#MT-MODE-1  #do not remove this line!

	super=SVSuper(input, super_params)
	vectors=SVAnalyse(super, analyse_params, src=input)
	smooth=SVSmoothFPS(input, super, vectors, smoothFPS_params, mt=threads, src=src)

	#MT-MODE-2  #do not remove this line!

	return demo_Mode==0 ? smooth : demo(input,smooth)
}

input=last

	stereo_type==0 ? eval(""" interpolate(input)	
""") : 	stereo_type==1 ? eval("""
		lf = interpolate(input.crop(0,0,input.width/2,0))
		rf = interpolate(input.crop(input.width/2,0,0,0))
		StackHorizontal(lf, rf)
""") : 	stereo_type==2 ? Eval("""
		lf = interpolate(input.crop(0,0,0,input.height/2))
		rf = interpolate(input.crop(0,input.height/2,0,0))
		StackVertical(lf, rf)""") : input

########### END OF base.avs ###########

#override= AnOR=="" || SmOR=="" ||SuOR=="" ? "" : "OVERRIDE MODE" WTF why dont works
override= AnOR!="" ? "OVERRIDE MODE" : SmOR!="" ? "OVERRIDE MODE" : SuOR!="" ? "OVERRIDE MODE" : ""
#"Orignumden="+String(orignum)+"/"+String(Origdenom)+"->"+String(FrameRateNumerator)+"/"+String(FrameRateDenominator)+"/8\n" + \  
SourceAspect = float(source_width) / float(source_height)
targetframerate=framerate
OSDtime= OSD==9? (Framecount-1) : round(float(FrameRateNumerator)*OSD/FrameRateDenominator)	
part1AnOR=""
part2AnOR=""
#"+String(SourceAspect)+" 
AnOR!="" ? eval("""
Length=StrLen(AnOR)
MaxStrWidth=100
part1AnOR=LeftStr(AnOR,MaxStrWidth)
part2AnOR=RightStr(AnOR,Length-MaxStrWidth)
""") : ""
OSD>0? eval("""
fontsize=FontSize*width/1920.0
Subtitle( \
 ""+String(source_width)+"x"+String(source_height)+" "+String(origframerate)+"*"+String(float(num)/denum)+"="+String(targetframerate)+"("+String(FPS)+") \n" + \   
 "Radius:"+String(Radius)+"/8 BadLev:"+String(BadLev)+"/3\n" + \  
 "MaskArtefact:"+String(MaskArtefact)+" Block:"+String(BlockSize)+"/8 "+BlockSizePx+"px\n" + \  
 "GPU:"+String(gpu)+" Mode:"+String(mode)+"/5\n" + \  
 "Pel:"+String(pel)+"/4 Threads:"+String(threads)+"\n" + \  
 "WeakGPU:"+String(weakgpu)+"/3 CoarseWidth:"+String(CoarseWidth)+" \n" + \
 "SearchDistance:"+String(SearchDistance)+" OSD:"+String(OSD)+"sec\n" , \
         font=Font, size=fontsize, text_color=FontColor, spc=2, lsp=10, last_frame = OSDtime )
Subtitle( \
  ""+SuOR+"\n" + \
  ""+part1AnOR+"\n" + \
  ""+part2AnOR+"\n" + \
  ""+SmOR+"\n", \
         font=Font, size=fontsize, text_color=FontColor-$4400, spc=2, y= height-10*fontsize, lsp=10, last_frame = OSDtime )
Subtitle( \
  "PPcheck:"+String(PPcheck)+" "+String(wtf1)+" "+String(wtf2)+" "+String(wtf3)+"\n" + \
  ""+super_params+"\n" + \
  ""+part1+"\n"  + \
  ""+part2+"\n"  + \
  ""+smoothFPS_params+"\n", \
         font=Font, size=fontsize, text_color=FontColor, spc=2, y= height-6*fontsize, lsp=10, last_frame = OSDtime )
Subtitle( \
  "SuperSVP 190516\n" + \
  "vk.com/potplayerms t.me/supersvp \n", \
         font=Font, size=fontsize*1.2, text_color=FontColor, spc=2, y= height-2*fontsize, lsp=10, align=3, last_frame = OSDtime )
""") : ("")
Space=""+chr(13)+""
WriteFileStart("someinfo.txt", "super_params", "Space", "analyse_params", "Space", "smoothFPS_params")
Prefetch(threads)
/*
190516
���������� ��������� ��������� Radius, BadLev ������������ ������������� (���� � �� ����, ��� ������ �������� ���������) � ���������. ������������ ��� ������ ���������� ���������� ��������
������� 30 ���� 35 ��������, � 30 ������ ����� �� ��� � ������, ������ Pel=1, ��� ������ ������� ��������
��������� � ����� � ������� ����������, ������ ���� ������ ��� ��������� ������, ��������� �������� �����
Thsad ���������� 250 ��� ���������

190509
�������� mode5, ��� ������ ��������, ��� ��� �������� � ������ ������������� 1 ����� (�� �� ����� ��������� �������� �����, ��� �� ���������), �� ��� ������������ ������� ����������� ������ ���������� � m2 ����� (��� ������). ����� ������������ �� ���������, ����� 00 �������
������ ������� ����������� avisynth+, ���������� � �������� ��� ��������� ������� � FFDSHOW X86 ��� X64. ���� ������, ��� ������ ����� ������� ������ ����� ffdshow ���������.

190506
�������� �������� � ��������� ���������

190505
�������� mode 4, ��� ������������ mode 1.5 � ���� ������ ���. � ����� �� ���� �������, ��� ��� ��������, �� �� ���� ��� ������ ����������� ������ ����� 1 � 2 � ����������� �� ��������. ������ ����� �� �������� ��������� �������� �� �� � � ���� ������� (����� ��) ����. ���� ������ ����� �������������� �� ��������� �������� mode:1. � ������ ���� ����� �� ���������, ����� ���-�� �������
�������� �������� ������� ��, � ������ ���=0 ������ ����� ���-�� ���� ����������+1
�������� ����� ���������� � ����� ���������� ���
��������� ����������� ��������� ���� ��� search � coarse, �������� 1,2,4 ��� ������, ��� �� ���� �����, �� ������ ������� ������, � ����� � ��������� �� �����.


190501
�������� ��������� ��� ����, ����� ����������� ���.

190427
��������� ������ � ����� - ��������� �������, ����� (��������� ������������), ���� ������.

190424
����� ������� � ���������� ������, ������ ����������
���������� ������, ���������� � ��������� ��������� �������. ������ ���������, ������ ��������� �������� �� ��������� type:2
Debug ������������ � OSD, ������ �� ����������� ����� ���������� ������
���������� ������ ����� - ���� ������� 0, �� � �� �����, ���� ������� 9 - ��� ����� ���� �����, ���� ������� ����� ������ �������� - ��� ����� ������� ������, ������� ����

���-������ ������,��������:
������������� � ffdshow, ������ ��� ��� ����� �������� � ������� (����� ������ ���-�� ����)
��������� ��� �����, �������� ������ �����. ���� ��� �� ��������� ����������.
�������� "��������" ����������� � 1 ����. �� ����, ����� ����� ��� �������� 1, ���� 64, � ����������� �� ������, ����� ����������� ��������.
������� ���� ���������� � ��������� ����
��� � ������� avspmod - ��������� ����� ����� ������� ���������� � ������. �� ������� ������� �����������
����������� � �������, ��������� ��� �������� ��� ���������� �������� �����

*/