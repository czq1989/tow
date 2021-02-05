
--------------------------------------
-- solution configuration
workspace "tow"
location "projects"
configurations {"Debug", "Release"}

-- directory
objdir "projects/objs"
debugdir "./"

-- shared config
language "C++"
characterset "MBCS"
defines "_CRT_SECURE_NO_WARNINGS"
if string.find(_ACTION, "vs") then
    disablewarnings "4201" -- disable nameless struct/union warning
end

-- conditional config
filter "system:Windows"
    systemversion("latest")
filter "Debug"
    symbols "on"
    defines "DEBUG"
filter "Release"
    optimize "on"
    defines "NDEBUG"
filter {}

-- active project
startproject "tow"

-------------------------------------
-- imgui project
project "imgui"
location "projects/imgui"
kind "StaticLib"
links "OpenGL32"
defines "IMGUI_IMPL_OPENGL_LOADER_GLAD"

-- files
files {
    "externals/imgui/*.cpp",
    "externals/glad/*.c",
}

-- directory
targetdir "projects/libs"
includedirs {
    "externals/imgui",
    "externals/glfw",
    "externals/glad/KHR",
    "externals/glad/",
    "externals/",
}

-- conditional config
filter "Debug"
    targetsuffix "_d"
    links "externals/glfw/glfw3_d"
filter "Release"
    links "externals/glfw/glfw3"
filter {}

-----------------------------------------
-- psdump project
project "psdump"
kind "StaticLib"
location "projects/psdump"
targetdir "projects/libs"

-- files
files {
    "externals/psdump/src/*.c",
    "externals/psdump/src/*.cpp",
    "externals/psdump/src/parser/*.cpp",
    "externals/psdump/src/lodepng/*.cpp",
    "externals/psdump/src/formatter/*.cpp",
    "externals/psdump/libpsd-0.9/src/*.c",
}

-- directory
includedirs {
    "externals/psdump/src",
    "externals/psdump/src/parser",
    "externals/psdump/src/lodepng",
    "externals/psdump/src/formatter",
    "externals/psdump/libpsd-0.9/include",
}

-- conditional config
filter "Debug"
    targetsuffix "_d"
filter {}

------------------------------------------------
-- tow project
project "tow"
location "projects/tow"
kind "ConsoleApp"
defines "IMGUI_IMPL_OPENGL_LOADER_GLAD"
links "OpenGL32"
warnings "Extra" -- highest warning level

-- directory
targetdir "./"
libdirs {"projects/libs"}
includedirs {
    "externals/imgui",
    "externals/font",
    "externals/glfw",
    "externals/glfw/GLFW",
    "externals/glad/KHR",
    "externals/glad",
    "externals/glm",
    "externals/gltf",
    "externals/psdump/src",
    "externals/psdump/src/parser",
    "externals/psdump/libpsd-0.9/include",
    "externals",
    "source/tow",
    "source/examples",
    "source/examples/asset_manager",
    "source/examples/ui_editor",
    "source/examples/shader_toy",
    "source/examples/gltf_model_viewer",
    "source/examples/block_world_editor",
    "source/examples/simple_paint",
}

-- files
files {
    "source/tow/tow.cpp",
    "source/tow/tow.h",

    "source/tow/call_stack.h",
    "source/examples/*.cpp",
    "source/examples/*.h",
    "source/examples/asset_manager/*.cpp",
    "source/examples/asset_manager/*.h",
    "source/examples/gltf_model_viewer/*.cpp",
    "source/examples/gltf_model_viewer/*.h",
    "source/examples/shader_toy/*.cpp",
    "source/examples/shader_toy/*.h",
    "source/examples/ui_editor/*.cpp",
    "source/examples/ui_editor/*.h",
    "source/examples/block_world_editor/*.cpp",
    "source/examples/block_world_editor/*.h",

    "source/examples/simple_paint/*.cpp",
    "source/examples/simple_paint/*.h",

}
filter "system:Windows"
    files "source/tow/call_stack_win32.cpp"
filter "system:not Windows"
    files "source/tow/call_stack.cpp"
filter {}

-- conditional config
filter "Debug"
    links {"externals/glfw/glfw3_d", "imgui_d", "psdump_d"}
filter "Release"
    links {"externals/glfw/glfw3", "imgui", "psdump"}
filter "system:Windows"
    links "DbgHelp"
filter {}

