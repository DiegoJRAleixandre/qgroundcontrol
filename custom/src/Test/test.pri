HEADERS += \
        $$PWD/test.h
SOURCES += \
        $$PWD/test.cpp

# or-tools lib
ORTOOLS_PATH = $$PWD/or-tools/
INCLUDEPATH += $${ORTOOLS_PATH}/include
LIBS += -L$${ORTOOLS_PATH}/lib -lCbc -lglog -lgflags -lCbcSolver -lCbc -lOsiCbc -lCgl -lClpSolver -lClp -lOsiClp -lOsi -lCoinUtils -lortools -lz -lrt -lpthread
