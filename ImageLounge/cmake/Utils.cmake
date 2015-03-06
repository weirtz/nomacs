# this macro is copied from OpenCV - OpenCVUtils.cmake
# Provides an option that the user can optionally select.
# Can accept condition to control when option is available for user.
# Usage:
#   option(<option_variable> "help string describing the option" <initial value or boolean expression> [IF <condition>])
macro(NMC_OPTION variable description value)
  set(__value ${value})
  set(__condition "")
  set(__varname "__value")
  foreach(arg ${ARGN})
    if(arg STREQUAL "IF" OR arg STREQUAL "if")
      set(__varname "__condition")
    else()
      list(APPEND ${__varname} ${arg})
    endif()
  endforeach()
  unset(__varname)
  if("${__condition}" STREQUAL "")
    set(__condition 2 GREATER 1)
  endif()

  if(${__condition})
    if("${__value}" MATCHES ";")
      if(${__value})
        option(${variable} "${description}" ON)
      else()
        option(${variable} "${description}" OFF)
      endif()
    elseif(DEFINED ${__value})
      if(${__value})
        option(${variable} "${description}" ON)
      else()
        option(${variable} "${description}" OFF)
      endif()
    else()
      option(${variable} "${description}" ${__value})
    endif()
  else()
    unset(${variable} CACHE)
  endif()
  unset(__condition)
  unset(__value)
endmacro(NMC_OPTION)

# Searches for Qt with the required components
macro(NMC_FINDQT)
  # unsetting all QT variables manually (when switching from Qt4 to Qt5 in the gui)
  unset(QT_ARTHURPLUGIN_PLUGIN_DEBUG CACHE)
  unset(QT_ARTHURPLUGIN_PLUGIN_RELEASE CACHE)
  unset(QT_BINARY_DIR CACHE)
  unset(QT_CONTAINEREXTENSION_PLUGIN_DEBUG CACHE)
  unset(QT_CONTAINEREXTENSION_PLUGIN_RELEASE CACHE)
  unset(QT_CUSTOMWIDGETPLUGIN_PLUGIN_DEBUG CACHE)
  unset(QT_CUSTOMWIDGETPLUGIN_PLUGIN_RELEASE CACHE)
  unset(QT_DBUSCPP2XML_EXECUTABLE CACHE)
  unset(QT_DBUSXML2CPP_EXECUTABLE CACHE)
  unset(QT_DESIGNER_EXECUTABLE CACHE)
  unset(QT_DLL_PATH_tmp CACHE)
  unset(QT_DOC_DIR CACHE)
  unset(QT_HEADERS_DIR CACHE)
  unset(QT_IMPORTS_DIR CACHE)
  unset(QT_INCLUDES CACHE)
  unset(QT_LIBRARIES CACHE)
  unset(QT_LIBRARY_DIR CACHE)
  unset(QT_LINGUIST_EXECUTABLE CACHE)
  unset(QT_LRELEASE_EXECUTABLE CACHE)
  unset(QT_LUPDATE_EXECUTABLE CACHE)
  unset(QT_MKSPECS_DIR CACHE)
  unset(QT_MOC_EXECUTABLE CACHE)
  unset(QT_PHONONWIDGETS_PLUGIN_DEBUG CACHE)
  unset(QT_PHONONWIDGETS_PLUGIN_RELEASE CACHE)
  unset(QT_PHONON_DS9_PLUGIN_DEBUG CACHE)
  unset(QT_PHONON_DS9_PLUGIN_RELEASE CACHE)
  unset(QT_PHONON_INCLUDE_DIR CACHE)
  unset(QT_PHONON_LIBRARY CACHE)
  unset(QT_PHONON_LIBRARY_DEBUG CACHE)
  unset(QT_PHONON_LIBRARY_RELEASE CACHE)
  unset(QT_PLUGINS_DIR CACHE)
  unset(QT_QAXCONTAINER_INCLUDE_DIR CACHE)
  unset(QT_QAXCONTAINER_LIBRARY CACHE)
  unset(QT_QAXCONTAINER_LIBRARY_DEBUG CACHE)
  unset(QT_QAXCONTAINER_LIBRARY_RELEASE CACHE)
  unset(QT_QAXSERVER_INCLUDE_DIR CACHE)
  unset(QT_QAXSERVER_LIBRARY CACHE)
  unset(QT_QAXSERVER_LIBRARY_DEBUG CACHE)
  unset(QT_QAXSERVER_LIBRARY_RELEASE CACHE)
  unset(QT_QCNCODECS_PLUGIN_DEBUG CACHE)
  unset(QT_QCNCODECS_PLUGIN_RELEASE CACHE)
  unset(QT_QCOLLECTIONGENERATOR_EXECUTABLE CACHE)
  unset(QT_QCOREWLANBEARER_PLUGIN_DEBUG CACHE)
  unset(QT_QCOREWLANBEARER_PLUGIN_RELEASE CACHE)
  unset(QT_QDECLARATIVEVIEW_PLUGIN_DEBUG CACHE)
  unset(QT_QDECLARATIVEVIEW_PLUGIN_RELEASE CACHE)
  unset(QT_QDECORATIONDEFAULT_PLUGIN_DEBUG CACHE)
  unset(QT_QDECORATIONDEFAULT_PLUGIN_RELEASE CACHE)
  unset(QT_QDECORATIONWINDOWS_PLUGIN_DEBUG CACHE)
  unset(QT_QDECORATIONWINDOWS_PLUGIN_RELEASE CACHE)
  unset(QT_QGENERICBEARER_PLUGIN_DEBUG CACHE)
  unset(QT_QGENERICBEARER_PLUGIN_RELEASE CACHE)
  unset(QT_QGIF_PLUGIN_DEBUG CACHE)
  unset(QT_QGIF_PLUGIN_RELEASE CACHE)
  unset(QT_QGLGRAPHICSSYSTEM_PLUGIN_DEBUG CACHE)
  unset(QT_QGLGRAPHICSSYSTEM_PLUGIN_RELEASE CACHE)
  unset(QT_QICO_PLUGIN_DEBUG CACHE)
  unset(QT_QICO_PLUGIN_RELEASE CACHE)
  unset(QT_QIMSW_MULTI_PLUGIN_DEBUG CACHE)
  unset(QT_QIMSW_MULTI_PLUGIN_RELEASE CACHE)
  unset(QT_QJPCODECS_PLUGIN_DEBUG CACHE)
  unset(QT_QJPCODECS_PLUGIN_RELEASE CACHE)
  unset(QT_QJPEG_PLUGIN_DEBUG CACHE)
  unset(QT_QJPEG_PLUGIN_RELEASE CACHE)
  unset(QT_QKRCODECS_PLUGIN_DEBUG CACHE)
  unset(QT_QKRCODECS_PLUGIN_RELEASE CACHE)
  #unset(QT_QMAKE_EXECUTABLE CACHE)
  unset(QT_QMAKE_EXECUTABLE_LAST CACHE)
  unset(QT_QMAKE_PATH CACHE)
  unset(QT_QMNG_PLUGIN_DEBUG CACHE)
  unset(QT_QMNG_PLUGIN_RELEASE CACHE)
  unset(QT_QNATIVEWIFIBEARER_PLUGIN_DEBUG CACHE)
  unset(QT_QNATIVEWIFIBEARER_PLUGIN_RELEASE CACHE)
  unset(QT_QSQLDB2_PLUGIN_DEBUG CACHE)
  unset(QT_QSQLDB2_PLUGIN_RELEASE CACHE)
  unset(QT_QSQLIBASE_PLUGIN_DEBUG CACHE)
  unset(QT_QSQLIBASE_PLUGIN_RELEASE CACHE)
  unset(QT_QSQLITE2_PLUGIN_DEBUG CACHE)
  unset(QT_QSQLITE2_PLUGIN_RELEASE CACHE)
  unset(QT_QSQLITE_PLUGIN_DEBUG CACHE)
  unset(QT_QSQLITE_PLUGIN_RELEASE CACHE)
  unset(QT_QSQLMYSQL_PLUGIN_DEBUG CACHE)
  unset(QT_QSQLMYSQL_PLUGIN_RELEASE CACHE)
  unset(QT_QSQLOCI_PLUGIN_DEBUG CACHE)
  unset(QT_QSQLOCI_PLUGIN_RELEASE CACHE)
  unset(QT_QSQLODBC_PLUGIN_DEBUG CACHE)
  unset(QT_QSQLODBC_PLUGIN_RELEASE CACHE)
  unset(QT_QSQLPSQL_PLUGIN_DEBUG CACHE)
  unset(QT_QSQLPSQL_PLUGIN_RELEASE CACHE)
  unset(QT_QSQLTDS_PLUGIN_DEBUG CACHE)
  unset(QT_QSQLTDS_PLUGIN_RELEASE CACHE)
  unset(QT_QSVGICON_PLUGIN_DEBUG CACHE)
  unset(QT_QSVGICON_PLUGIN_RELEASE CACHE)
  unset(QT_QSVG_PLUGIN_DEBUG CACHE)
  unset(QT_QSVG_PLUGIN_RELEASE CACHE)
  unset(QT_QT3SUPPORTWIDGETS_PLUGIN_DEBUG CACHE)
  unset(QT_QT3SUPPORTWIDGETS_PLUGIN_RELEASE CACHE)
  unset(QT_QT3SUPPORT_INCLUDE_DIR CACHE)
  unset(QT_QT3SUPPORT_LIBRARY CACHE)
  unset(QT_QT3SUPPORT_LIBRARY_DEBUG CACHE)
  unset(QT_QT3SUPPORT_LIBRARY_RELEASE CACHE)
  unset(QT_QTACCESSIBLECOMPATWIDGETS_PLUGIN_DEBUG CACHE)
  unset(QT_QTACCESSIBLECOMPATWIDGETS_PLUGIN_RELEASE CACHE)
  unset(QT_QTACCESSIBLEWIDGETS_PLUGIN_DEBUG CACHE)
  unset(QT_QTACCESSIBLEWIDGETS_PLUGIN_RELEASE CACHE)
  unset(QT_QTASSISTANTCLIENT_INCLUDE_DIR CACHE)
  unset(QT_QTASSISTANTCLIENT_LIBRARY CACHE)
  unset(QT_QTASSISTANTCLIENT_LIBRARY_DEBUG CACHE)
  unset(QT_QTASSISTANTCLIENT_LIBRARY_RELEASE CACHE)
  unset(QT_QTASSISTANT_INCLUDE_DIR CACHE)
  unset(QT_QTASSISTANT_LIBRARY CACHE)
  unset(QT_QTASSISTANT_LIBRARY_DEBUG CACHE)
  unset(QT_QTASSISTANT_LIBRARY_RELEASE CACHE)
  unset(QT_QTCLUCENE_LIBRARY CACHE)
  unset(QT_QTCLUCENE_LIBRARY_DEBUG CACHE)
  unset(QT_QTCLUCENE_LIBRARY_RELEASE CACHE)
  unset(QT_QTCORE_INCLUDE_DIR CACHE)
  unset(QT_QTCORE_LIBRARY_DEBUG CACHE)
  unset(QT_QTCORE_LIBRARY_RELEASE CACHE)
  unset(QT_QTDBUS_INCLUDE_DIR CACHE)
  unset(QT_QTDBUS_LIBRARY CACHE)
  unset(QT_QTDBUS_LIBRARY_DEBUG CACHE)
  unset(QT_QTDBUS_LIBRARY_RELEASE CACHE)
  unset(QT_QTDECLARATIVE_INCLUDE_DIR CACHE)
  unset(QT_QTDECLARATIVE_LIBRARY CACHE)
  unset(QT_QTDECLARATIVE_LIBRARY_DEBUG CACHE)
  unset(QT_QTDECLARATIVE_LIBRARY_RELEASE CACHE)
  unset(QT_QTDESIGNERCOMPONENTS_INCLUDE_DIR CACHE)
  unset(QT_QTDESIGNERCOMPONENTS_LIBRARY CACHE)
  unset(QT_QTDESIGNERCOMPONENTS_LIBRARY_DEBUG CACHE)
  unset(QT_QTDESIGNERCOMPONENTS_LIBRARY_RELEASE CACHE)
  unset(QT_QTDESIGNER_INCLUDE_DIR CACHE)
  unset(QT_QTDESIGNER_LIBRARY CACHE)
  unset(QT_QTDESIGNER_LIBRARY_DEBUG CACHE)
  unset(QT_QTDESIGNER_LIBRARY_RELEASE CACHE)
  unset(QT_QTGA_PLUGIN_DEBUG CACHE)
  unset(QT_QTGA_PLUGIN_RELEASE CACHE)
  unset(QT_QTGUI_INCLUDE_DIR CACHE)
  unset(QT_QTGUI_LIBRARY_DEBUG CACHE)
  unset(QT_QTGUI_LIBRARY_RELEASE CACHE)
  unset(QT_QTHELP_INCLUDE_DIR CACHE)
  unset(QT_QTHELP_LIBRARY CACHE)
  unset(QT_QTHELP_LIBRARY_DEBUG CACHE)
  unset(QT_QTHELP_LIBRARY_RELEASE CACHE)
  unset(QT_QTIFF_PLUGIN_DEBUG CACHE)
  unset(QT_QTIFF_PLUGIN_RELEASE CACHE)
  unset(QT_QTMAIN_LIBRARY_DEBUG CACHE)
  unset(QT_QTMAIN_LIBRARY_RELEASE CACHE)
  unset(QT_QTMULTIMEDIA_INCLUDE_DIR CACHE)
  unset(QT_QTMULTIMEDIA_LIBRARY CACHE)
  unset(QT_QTMULTIMEDIA_LIBRARY_DEBUG CACHE)
  unset(QT_QTMULTIMEDIA_LIBRARY_RELEASE CACHE)
  unset(QT_QTNETWORK_INCLUDE_DIR CACHE)
  unset(QT_QTNETWORK_LIBRARY_DEBUG CACHE)
  unset(QT_QTNETWORK_LIBRARY_RELEASE CACHE)
  unset(QT_QTNSPLUGIN_INCLUDE_DIR CACHE)
  unset(QT_QTNSPLUGIN_LIBRARY CACHE)
  unset(QT_QTNSPLUGIN_LIBRARY_DEBUG CACHE)
  unset(QT_QTNSPLUGIN_LIBRARY_RELEASE CACHE)
  unset(QT_QTOPENGL_INCLUDE_DIR CACHE)
  unset(QT_QTOPENGL_LIBRARY CACHE)
  unset(QT_QTOPENGL_LIBRARY_DEBUG CACHE)
  unset(QT_QTOPENGL_LIBRARY_RELEASE CACHE)
  unset(QT_QTRACEGRAPHICSSYSTEM_PLUGIN_DEBUG CACHE)
  unset(QT_QTRACEGRAPHICSSYSTEM_PLUGIN_RELEASE CACHE)
  unset(QT_QTSCRIPTDBUS_PLUGIN_DEBUG CACHE)
  unset(QT_QTSCRIPTDBUS_PLUGIN_RELEASE CACHE)
  unset(QT_QTSCRIPTTOOLS_INCLUDE_DIR CACHE)
  unset(QT_QTSCRIPTTOOLS_LIBRARY CACHE)
  unset(QT_QTSCRIPTTOOLS_LIBRARY_DEBUG CACHE)
  unset(QT_QTSCRIPTTOOLS_LIBRARY_RELEASE CACHE)
  unset(QT_QTSCRIPT_INCLUDE_DIR CACHE)
  unset(QT_QTSCRIPT_LIBRARY CACHE)
  unset(QT_QTSCRIPT_LIBRARY_DEBUG CACHE)
  unset(QT_QTSCRIPT_LIBRARY_RELEASE CACHE)
  unset(QT_QTSQL_INCLUDE_DIR CACHE)
  unset(QT_QTSQL_LIBRARY CACHE)
  unset(QT_QTSQL_LIBRARY_DEBUG CACHE)
  unset(QT_QTSQL_LIBRARY_RELEASE CACHE)
  unset(QT_QTSVG_INCLUDE_DIR CACHE)
  unset(QT_QTSVG_LIBRARY CACHE)
  unset(QT_QTSVG_LIBRARY_DEBUG CACHE)
  unset(QT_QTSVG_LIBRARY_RELEASE CACHE)
  unset(QT_QTTEST_INCLUDE_DIR CACHE)
  unset(QT_QTTEST_LIBRARY CACHE)
  unset(QT_QTTEST_LIBRARY_DEBUG CACHE)
  unset(QT_QTTEST_LIBRARY_RELEASE CACHE)
  unset(QT_QTUITOOLS_INCLUDE_DIR CACHE)
  unset(QT_QTUITOOLS_LIBRARY CACHE)
  unset(QT_QTUITOOLS_LIBRARY_DEBUG CACHE)
  unset(QT_QTUITOOLS_LIBRARY_RELEASE CACHE)
  unset(QT_QTWCODECS_PLUGIN_DEBUG CACHE)
  unset(QT_QTWCODECS_PLUGIN_RELEASE CACHE)
  unset(QT_QTWEBKIT_INCLUDE_DIR CACHE)
  unset(QT_QTWEBKIT_LIBRARY CACHE)
  unset(QT_QTWEBKIT_LIBRARY_DEBUG CACHE)
  unset(QT_QTWEBKIT_LIBRARY_RELEASE CACHE)
  unset(QT_QTXMLPATTERNS_INCLUDE_DIR CACHE)
  unset(QT_QTXMLPATTERNS_LIBRARY CACHE)
  unset(QT_QTXMLPATTERNS_LIBRARY_DEBUG CACHE)
  unset(QT_QTXMLPATTERNS_LIBRARY_RELEASE CACHE)
  unset(QT_QTXML_INCLUDE_DIR CACHE)
  unset(QT_QTXML_LIBRARY CACHE)
  unset(QT_QTXML_LIBRARY_DEBUG CACHE)
  unset(QT_QTXML_LIBRARY_RELEASE CACHE)
  unset(QT_QWEBVIEW_PLUGIN_DEBUG CACHE)
  unset(QT_QWEBVIEW_PLUGIN_RELEASE CACHE)
  unset(QT_QWSTSLIBMOUSEHANDLER_PLUGIN_DEBUG CACHE)
  unset(QT_QWSTSLIBMOUSEHANDLER_PLUGIN_RELEASE CACHE)
  unset(QT_RCC_EXECUTABLE CACHE)
  unset(QT_ROOT CACHE)
  unset(QT_TASKMENUEXTENSION_PLUGIN_DEBUG CACHE)
  unset(QT_TASKMENUEXTENSION_PLUGIN_RELEASE CACHE)
  unset(QT_TRANSLATIONS_DIR CACHE)
  unset(QT_UIC3_EXECUTABLE CACHE)
  unset(QT_UIC_EXECUTABLE CACHE)
  unset(QT_WORLDTIMECLOCKPLUGIN_PLUGIN_DEBUG CACHE)
  unset(QT_WORLDTIMECLOCKPLUGIN_PLUGIN_RELEASE CACHE)

  
	# set(CMAKE_AUTOMOC ON)
	set(CMAKE_INCLUDE_CURRENT_DIR ON)
	# find the Qt
	if (NOT ENABLE_QT5)
		set(QT_MIN_VERSION "4.7.0")
		set(QT_USE_GUI 1)
		set(QT_USE_QTNETWORK 1)
		if(ENABLE_UPNP)
			find_package(Qt4 REQUIRED QtCore QtGui QtNetwork QtXml)
		else()
			find_package(Qt4 REQUIRED QtCore QtGui QtNetwork)
		endif(ENABLE_UPNP)
		
		find_package(Qt4 REQUIRED QtCore QtGui QtNetwork)
		
		set(QT_LIBRARIES ${QT_QTCORE_LIBRARY} ${QT_QTGUI_LIBRARY} ${QT_QTNETWORK_LIBRARY} ${QT_QTMAIN_LIBRARY})
		include(${QT_USE_FILE})
    set(QT_ROOT ${QT_QTCORE_INCLUDE_DIR}/../..)
	else()
		if(NOT QT_QMAKE_EXECUTABLE)
			find_program(QT_QMAKE_EXECUTABLE NAMES "qmake" "qmake-qt5" "qmake.exe")
		endif()
		if(NOT QT_QMAKE_EXECUTABLE)
			message(FATAL_ERROR "you have to set the path to the Qt5 qmake executable")
		endif()
    GET_FILENAME_COMPONENT(QT_QMAKE_PATH ${QT_QMAKE_EXECUTABLE} PATH)
    set(QT_ROOT ${QT_QTCORE_INCLUDE_DIR}/../)
    set(CMAKE_PREFIX_PATH ${QT_QMAKE_PATH}\\..\\lib\\cmake\\Qt5)
    find_package(Qt5 REQUIRED Widgets Network LinguistTools PrintSupport Concurrent)
		if (NOT Qt5_FOUND)
			message(FATAL_ERROR "Qt5Widgets not found. Check your QT_QMAKE_EXECUTABLE path and set it to the correct location")
		endif()
		add_definitions(-DQT5)
	endif(NOT ENABLE_QT5)
	
endmacro(NMC_FINDQT)

# enables webp
# macro(NMC_ENABLE_WEBP)
	# SET(WEBP_INCLUDE_DIR "")
	# SET(WEBP_SOURCE "")
	# if(ENABLE_WEBP)
		# add_definitions(-DNDEBUG -DWEBP_USE_THREAD)
	
		# file(GLOB WEBP_DEC_SRCS
			# RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
			# ${CMAKE_CURRENT_SOURCE_DIR}/libwebp/src/dec/*c
		# )
		
		# file(GLOB WEBP_DEMUX_SRCS
			# RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
			# ${CMAKE_CURRENT_SOURCE_DIR}/libwebp/src/demux/*c
		# )
	
		# file(GLOB WEBP_DSP_SRCS
			# RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
			# ${CMAKE_CURRENT_SOURCE_DIR}/libwebp/src/dsp/*c
		# )
	
		# file(GLOB WEBP_ENC_SRCS
			# RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
			# ${CMAKE_CURRENT_SOURCE_DIR}/libwebp/src/enc/*c
		# )
	
		# file(GLOB WEBP_UTILS_SRCS
			# RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
			# ${CMAKE_CURRENT_SOURCE_DIR}/libwebp/src/utils/*c
		# )
	
		# file(GLOB WEBP_MUX_SRCS
			# RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
			# ${CMAKE_CURRENT_SOURCE_DIR}/libwebp/src/mux/*c
		# )
		# set(WEBP_SOURCE ${WEBP_DEC_SRCS} ${WEBP_DEMUX_SRCS} ${WEBP_DSP_SRCS} ${WEBP_ENC_SRCS} ${WEBP_UTILS_SRCS} ${WEBP_MUX_SRC})
		# set(WEBP_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libwebp/src)
		# add_definitions(-DWITH_WEBP)
	# endif(ENABLE_WEBP)
# endmacro(NMC_ENABLE_WEBP)


