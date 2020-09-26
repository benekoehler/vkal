
@echo off




set vulkan_include= %VK_SDK_PATH%\Include
set vulkan_lib_64=  %VK_SDK_PATH%\Lib

set glfw_include= ..\src\external\glfw
set glfw_lib_64=  ..\src\external\glfw\lib

set flags_debug=   -std=c99 -m64 -Wall -Wextra -pedantic-errors -fextended-identifiers -Wno-unused-parameter -Wno-unused-variable -Wno-missing-braces -g -D _DEBUG -D VKAL_GLFW -I%vulkan_include% -I%glfw_include%
set flags_release=   -std=c99 -Wall -Wextra -pedantic-errors -fextended-identifiers


set clang_flags_debug= /TC /Z7 /DDEBUG /W4 /WX /MDd -Qunused-arguments
set clang_flags_debug_easy= /TC /Z7 /DDEBUG /DVKAL_GLFW /W4 /MDd -Qunused-arguments -Wno-unused-variable -ferror-limit=100
set clang_flags_release= /TC /O2 /W4 /MD -Qunused-arguments -Wno-unused-variable

set tcc_flags_debug= -Wall -g
set tcc_flags_release= -Wall

pushd "%~dp0"
mkdir build
pushd build

REM gcc %flags_debug%  ..\src\examples\textures_descriptorarray.c ..\src\vkal.c ..\src\platform.c -L%vulkan_lib_64%\ -L%glfw_lib_64%\ -l:vulkan-1.lib -l:glfw3dll.lib -o gcc_textures_descriptorarray.exe
REM gcc %flags_debug%  ..\src\examples\rendertexture.c ..\src\vkal.c ..\src\platform.c -L%vulkan_lib_64%\ -L%glfw_lib_64%\ -l:vulkan-1.lib -l:glfw3dll.lib -o gcc_rendertexture.exe
REM gcc %flags_release% ..\src\main.c -o gcc_release_main

REM clang-cl %clang_flags_debug%   ..\src\main.c -o clang_dbg_main.exe
REM clang-cl %clang_flags_debug_easy%  ..\src\examples\textures_descriptorarray.c ..\src\vkal.c ..\src\platform.c -o clang_dbg_easy_textures_descriptorarray.exe /I%vulkan_include% /I%glfw_include% /link %vulkan_lib_64%\vulkan-1.lib %glfw_lib_64%\glfw3dll.lib
REM clang-cl %clang_flags_debug_easy%  ..\src\examples\textures.c ..\src\vkal.c ..\src\platform.c -o clang_dbg_easy_textures.exe /I%vulkan_include% /I%glfw_include% /link %vulkan_lib_64%\vulkan-1.lib %glfw_lib_64%\glfw3dll.lib
REM clang-cl %clang_flags_debug_easy%  ..\src\examples\textures_descriptorarray_push_constant.c ..\src\vkal.c ..\src\platform.c -o clang_dbg_easy_textures_descriptorarray_push_constant.exe /I%vulkan_include% /I%glfw_include% /link %vulkan_lib_64%\vulkan-1.lib %glfw_lib_64%\glfw3dll.lib
REM clang-cl %clang_flags_debug_easy%  ..\src\examples\rendertexture.c ..\src\vkal.c ..\src\platform.c -o rendertexture.exe /I%vulkan_include% /I%glfw_include% /link %vulkan_lib_64%\vulkan-1.lib %glfw_lib_64%\glfw3dll.lib
clang-cl %clang_flags_debug_easy%  ..\src\examples\model_loading.c ..\src\examples\utils\tr_math.c ..\src\vkal.c ..\src\platform.c -o clang_dbg_easy_model_loading.exe /I%vulkan_include% /I%glfw_include% /link %vulkan_lib_64%\vulkan-1.lib %glfw_lib_64%\glfw3dll.lib
REM clang-cl %clang_flags_release% ..\src\main.c ..\src\vkal.c -o clang_rel_main.exe

REM tcc %tcc_flags_debug%   ..\src\main.c -o tcc_dbg_main.exe
REM tcc %tcc_flags_release% ..\src\main.c -o tcc_rel_main.exe


popd
popd


