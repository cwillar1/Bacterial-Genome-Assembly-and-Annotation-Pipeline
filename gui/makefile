CXX = g++
CXXFLAGS = -Wall

driver: main.cpp
	$(CXX) $(CXXFLAGS) main.cpp -o driver `pkg-config --cflags --libs gtk+-3.0`

clean:
	rm *.o*
	rm *~

run:
	./driver
