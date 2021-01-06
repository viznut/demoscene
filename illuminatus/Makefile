all: illu
	./illu

illu: illu.c telaketju.h
	gcc -O2 illu.c -o illu `sdl-config --libs --cflags` -lSDL_image -lm

#illu.exe: illu.c telaketju.h
#	i686-w64-mingw32-gcc -O2 

illu.html: illu.c
	emcc -Oz illu.c -o illu.html --preload-file assets --use-preload-plugins
	uglifyjs illu.js -c > illu-u.js
	mv illu-u.js illu.js
#	EMCC_DEBUG=1 emcc  illu.c -o illu.html --preload-file assets --use-preload-plugins --emrun
	emrun illu.html

clean:
	rm -f *~ illu illu.exe illu.html illu.js illu*mem* illu.data
