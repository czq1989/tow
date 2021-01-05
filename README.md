# TOW

TOW is a tiny OpenGL wrapper written in [Literate](https://github.com/zyedidia/Literate). The Literate code of TOW is not much different from C++, you can read them without any knowledge about Literate. TOW only encapsulates the primary functions of OpenGL but provides more convenient methods with safety and less overhead🚀.

To draw things on the screen, usually, you only need these two objects:  `Framebuffer` and  `Graphicpipeline`,  see the code below for detail.

```C++
// draw a simple triangle
tow::FramebufferPtr fb;
tow::GraphicPipelinePtr pipeline;

void init(){
    using namespace tow;
    
    fb = Framebuffer::create();
    
    vec2 vertices[] = { {-1, -1}, {1, -1}, {0, 1} };
    auto layout = VertexLayout::create();
    layout->add("a_position", {GL_FLOAT, 2});
    layout->stride(sizeof(vec2));
    
    auto bufGroup = BufferGroup::create();
    bufGroup->createBuffer("b_vertex", vertices, {GL_ARRAY_BUFFER, sizeof(vec2), 3});
    
    pipeline = GraphicPipeline::create({bufGroup, "b_vertex"}, layout);
}

void render(float x, float y, float w, float h){    
    fb->bind(x, y, w, h);
    tow::drawArrays(pipeline, GL_TRIANGLES);
}
```

## How to build

On Windows, make sure you have installed vs2017 or later before running premake5.bat.

On other platforms, you should install [premake5](https://premake.github.io/download.html), [make](https://www.gnu.org/software/make/) and [Literate](https://github.com/zyedidia/Literate) corresponding to the platform, and then type in the command:

```C++
make -C lit all
premake5 your_action
```

## How to clone

For most people, enter the command:

```C++
git clone https://github.com/czq1989/tow.git
```

But if you are in China and the cloning speed is slow, you can enter the command:

```
git clone https://gitclone.com/github.com/czq1989/tow.git
```

Or download the project directly from [here](https://share.weiyun.com/MrKPfxsF).

## Examples

### glTF Model Viewer

A viewer that can load [gltf/glb](https://github.com/KhronosGroup/glTF/blob/master/README.md) file, and supports PBR, skin, morph target, and animation. Most files I have tested are from [sketchfab](https://sketchfab.com/3d-models?features=downloadable&sort_by=-likeCount) and [GeneratedAssets](https://github.com/KhronosGroup/glTF-Asset-Generator), however, in order to keep this repository small, I don't put all of them into the assets folder.

![gltf_model_viewer](https://user-images.githubusercontent.com/34378986/99016175-7ba79d00-2591-11eb-9ebe-6b07d8c0dee4.gif)

### Shader Toy

A simple [shader toy](https://www.shadertoy.com/) emulator that you can write glsl code to implement cool graphic effects.

![shader_toy](https://user-images.githubusercontent.com/34378986/99018475-21104000-2595-11eb-8091-77cfe782f2ff.gif)

### UI Editor

An editor that is used to edit game UI elements. If you have a [PSD](https://en.wikipedia.org/wiki/Adobe_Photoshop#File_format) file that all UI elements have already been arranged, drop it into the editor, then you can make some changes again or save it as a JSON file.

![ui_editor](https://user-images.githubusercontent.com/34378986/99016271-b4e00d00-2591-11eb-955c-4f37120d06e9.gif)

### Block World Editor

A block editor like Minecraft, but easier to select and create blocks.

![block_world_editor](https://user-images.githubusercontent.com/34378986/103600044-7f2c2480-4f41-11eb-992b-d25c1bac5ee7.gif)

## Credits

Thanks to:

* [ocornut/imgui](https://github.com/ocornut/imgui)
* [Dav1dde/glad](https://github.com/Dav1dde/glad)
* [g-truc/glm](https://github.com/g-truc/glm)
* [alco/psdump](https://github.com/alco/psdump)
* [juliettef/IconFontCppHeaders](https://github.com/juliettef/IconFontCppHeaders)
* [syoyo/tinygltf](https://github.com/syoyo/tinygltf)
* [nlohmann/json](https://github.com/nlohmann/json)
* [zyedidia/Literate](https://github.com/zyedidia/Literate)
* [nothings/stb](https://github.com/nothings/stb)
* [glfw/glfw](https://github.com/glfw/glfw)

