# TOW

TOW is a tiny OpenGL wrapper written in [Literate](https://github.com/zyedidia/Literate). The Literate code of TOW is not much different from C++, you can read them without any knowledge about Literate. TOW only encapsulates the primary functions of OpenGL but provides more convenient methods with safety and less overhead.🚀

To draw something on the screen, in most cases, you only need two objects:  `Framebuffer` and  `Graphicpipeline`,  see the code below for detail.

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
    glClear(GL_COLOR_BUFFER_BIT);
    tow::drawArrays(pipeline, GL_TRIANGLES);
}
```

## How to compile

On Windows, make sure you have installed vs2017 or later before running premake5.bat.

On other platforms, you should download your platform corresponding [premake5](https://premake.github.io/download.html) and [make](https://www.gnu.org/software/make/), and type in:

```C++
make -C lit all
premak5 your_action
```

## Examples

### glTF Model Viewer

A viewer that can load [gltf/glb](https://github.com/KhronosGroup/glTF/blob/master/README.md) file, and supports PBR, skin, morph target, and animation. Most files I have tested are from [sketchfab](https://sketchfab.com/3d-models?features=downloadable&sort_by=-likeCount) and [GeneratedAssets](https://github.com/KhronosGroup/glTF-Asset-Generator), however, in order to keep this repository size small, I don't put all of them into the assets folder.

![gltf model viewer](https://user-images.githubusercontent.com/34378986/98965647-3f4e4f80-2545-11eb-81d4-8be2efd8a5d4.gif)

### Shader Toy

A simple [shader toy](https://www.shadertoy.com/) simulator that you can write glsl code to implement cool graphic effects.

![shader toy](https://user-images.githubusercontent.com/34378986/98965721-568d3d00-2545-11eb-9877-02b41a062b71.gif)

### UI Editor

An editor that is used to edit game UI elements. If you have a [PSD](https://en.wikipedia.org/wiki/Adobe_Photoshop#File_format) file that all UI elements have already been arranged, drop it into the editor, then you can make some changes again or save as a JSON file.

![ui editor](https://user-images.githubusercontent.com/34378986/98966995-e54e8980-2546-11eb-9f6c-8eafe1834642.gif)