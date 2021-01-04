
#--------------------------------
# shared lits
shared_src := ../source/examples
shared_lit := examples/auxiliary.lit\
              examples/camera.lit\
              examples/color_pass.lit\
              examples/coordinate_axis.lit\
              examples/directional_lighting.lit\
              examples/environment_cube.lit\
              examples/example_util.lit\
              examples/main.lit\
              examples/solution.lit\
              examples/imgui_ex/imgui_ex.lit\
              examples/skeleton_group.lit\
              examples/sh_irradiance.lit\

$(shared_src)/dummy.target : $(shared_lit)
	../tools/lit -t $? dummy.lit -odir $(shared_src)

#--------------------------------------------------
# asset manager
asset_mgr_src := ../source/examples/asset_manager
asset_mgr_lit := examples/asset_manager/*.lit

$(asset_mgr_src)/dummy.target : $(asset_mgr_lit)
	../tools/lit -t $? dummy.lit -odir $(asset_mgr_src)

#-----------------------------------
# gltf model viewer
viewer_src := ../source/examples/gltf_model_viewer
viewer_lit := examples/gltf_model_viewer.lit

$(viewer_src)/dummy.target : $(viewer_lit)
	../tools/lit -t $? dummy.lit -odir $(viewer_src)

#------------------------------------------------
# ui editor
ui_editor_src := ../source/examples/ui_editor
ui_editor_lit := examples/ui_editor.lit

$(ui_editor_src)/dummy.target : $(ui_editor_lit)
	../tools/lit -t $? dummy.lit -odir $(ui_editor_src)

#--------------------------------------
# shader toy
toy_src := ../source/examples/shader_toy
toy_lit := examples/shader_toy/shader_toy.lit

$(toy_src)/dummy.target : $(toy_lit)
	../tools/lit -t $? dummy.lit -odir $(toy_src)

#---------------------------------------
# shader toy shader
toy_shader_src := ../assets/shaders/shader_toy
toy_shader_lit := examples/shader_toy/st_*.lit

$(toy_shader_src)/dummy.target : $(toy_shader_lit)
	../tools/lit -t $? dummy.lit -odir $(toy_shader_src)

#------------------------------------------------
# block world editor
block_world_editor_src := ../source/examples/block_world_editor
block_world_editor_lit := examples/block_world_editor.lit

$(block_world_editor_src)/dummy.target : $(block_world_editor_lit)
	../tools/lit -t $? dummy.lit -odir $(block_world_editor_src)

#-----------------------------------------
# shaders
shader_src := ../assets/shaders
shader_lit := examples/*_shader.lit\
              tow/pipeline_shader.lit

$(shader_src)/dummy.target : $(shader_lit)
	../tools/lit -t $? dummy.lit -odir $(shader_src)

#-----------------------------------------------
# tow
tow_src := ../source/tow
tow_lit := tow/draw_functions.lit\
           tow/pipeline.lit\
           tow/programable_stages.lit\
           tow/shader_variable.lit\
           tow/tow.lit\
           tow/vertex_specification.lit

$(tow_src)/dummy.target : $(tow_lit)
	../tools/lit -t tow/tow.lit tow/call_stack.lit dummy.lit -odir $(tow_src)

.PHONY: all
all: $(shared_src)/dummy.target\
     $(asset_mgr_src)/dummy.target\
     $(viewer_src)/dummy.target\
     $(ui_editor_src)/dummy.target\
     $(block_world_editor_src)/dummy.target\
     $(toy_src)/dummy.target\
     $(toy_shader_src)/dummy.target\
     $(shader_src)/dummy.target\
     $(tow_src)/dummy.target