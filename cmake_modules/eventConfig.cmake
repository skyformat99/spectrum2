FIND_PATH(EVENT_INCLUDE_DIRS libev/event.h)

SET(EVENT_NAMES ${EVENT_NAMES} ev libev)
FIND_LIBRARY(EVENT_LIBRARIES NAMES ${EVENT_NAMES} PATH)

IF(EVENT_INCLUDE_DIRS AND EVENT_LIBRARIES)
SET(HAVE_EVENT TRUE)
file(APPEND src/transport_config.h "#define WITH_LIBEVENT 1\n")
ELSE(EVENT_INCLUDE_DIRS AND EVENT_LIBRARIES)
SET (EVENT_INCLUDE_DIRS "")
SET (EVENT_LIBRARIES "")
ENDIF(EVENT_INCLUDE_DIRS AND EVENT_LIBRARIES)

IF(HAVE_EVENT)
MESSAGE(STATUS "Found Event: ${EVENT_LIBRARIES}")
ENDIF(HAVE_EVENT)