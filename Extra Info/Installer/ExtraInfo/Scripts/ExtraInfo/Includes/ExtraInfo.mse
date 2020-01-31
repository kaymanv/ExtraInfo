macroScript ExtraInfo category:"Extra Info" toolTip:"Extra Info" icon:#("ExtraInfoLogo", 1)
(
	try(DestroyDialog ExtraInfo)catch()
	
	local objNameCol = color 0 0 0 
	local objPosCol = color 0 0 0 
	local VertIndexCol = color 0 0 0
	local VertPosCol = color 0 0 0
	
	------------------------ FUNCTIONS ---------------------------
	(
		-- Show Object Name in viewport
		fn ViewportObjName =
		(
			gw.setTransform(Matrix3 1)
			for obj in objects do
			(
				gw.text obj.pos (obj.name as string) color:objNameCol
			)
		)

		-- Show Object Position in viewport
		fn ViewportObjPos =
		(
			gw.setTransform(Matrix3 1)
			for obj in objects do
			(
				gw.text obj.pos (obj.pos as string) color:objPosCol
			)
		)

		-- Show Vertex Index in viewport
		fn ViewportVertexIndex =
		(
			gw.setTransform(Matrix3 1)
			for obj in objects where obj.isselected == true do
			(
				if classOf obj == Editable_Poly then
				(
					for i = 1 to polyop.getNumVerts obj do
						gw.text (polyop.getVert obj i) (i as string) color:VertIndexCol
				)
				else if classOf obj == PolyMeshObject then
				(
					for i = 1 to obj.modifiers[#Edit_Poly].GetNumVertices() do
						gw.text (obj.modifiers[#Edit_Poly].GetVertex i)(i as string) color:VertIndexCol
				)
				else if classOf obj == Editable_mesh then
				(
					for i = 1 to getNumVerts obj do
						gw.text (meshop.getVert obj i) (i as string) color:VertIndexCol
				)
				else if classOf obj == Editable_Patch then
				(
					for i = 1 to getNumVerts obj do
						gw.text (patch.getVert obj i) (i as string) color:VertIndexCol
				)
				else if classOf obj == line then
				(
					for i = 1 to numKnots obj do
						gw.text (getKnotPoint obj 1 i) (i as string) color:VertIndexCol
				)
			)
		)

		-- Show Vertex Position in viewport
		fn ViewportVertexPos =
		(
			gw.setTransform(Matrix3 1)
			for obj in objects where obj.isselected == true do
			(
				if classOf obj == Editable_Poly then
				(
					for i = 1 to polyop.getNumVerts obj do
						gw.text (polyop.getVert obj i) (polyop.getVert obj i as string) color:VertPosCol
				)
				else if classOf obj == PolyMeshObject then
				(
					for i = 1 to obj.modifiers[#Edit_Poly].GetNumVertices() do
						gw.text (obj.modifiers[#Edit_Poly].GetVertex i)(obj.modifiers[#Edit_Poly].GetVertex i as string) color:VertPosCol
				)
				else if classOf obj == Editable_mesh then
				(
					for i = 1 to getNumVerts obj do
						gw.text (meshop.getVert obj i) (meshop.getVert obj i as string) color:VertPosCol
				)
				else if classOf obj == Editable_Patch then
				(
					for i = 1 to getNumVerts obj do
						gw.text (patch.getVert obj i) (patch.getVert obj i as string) color:VertPosCol
				)
				else if classOf obj == line then
				(
					for i = 1 to numKnots obj do
						gw.text (getKnotPoint obj 1 i) (getKnotPoint obj 1 i as string) color:VertPosCol
				)
			)
		)
	)
	
	--------------------- MAIN ROLLOUT ---------------------------------
	rollout ExtraInfo "Extra Info" height:175 width:200
	(
		subRollout buttonrollout "extra info in viewport"
		
		on ExtraInfo close do
		(
			UnregisterRedrawViewsCallback ViewportObjName
			UnregisterRedrawViewsCallback ViewportObjPos
			UnregisterRedrawViewsCallback ViewportVertexIndex
			UnregisterRedrawViewsCallback ViewportVertexPos
		)
	)
	
	-- FIRST SUBROLLOUT
	rollout buttons "Extra info in viewport" height:300
	(
		-- Add Buttons
		colorpicker cp_ObjName color:[128,128,255] across:2 fieldwidth:20 modal:false toolTip:"Color of object Name Text"
		checkbutton chkb_objName "Object Name" toolTip: "Show Object Name" width:100 align:#right
		colorpicker cp_ObjPos color:[128,255,128] across:2 fieldwidth:20 modal:false toolTip:"Color of object Position Text"
		checkbutton chkb_objPos "Object Position" toolTip: "Show Object Position" width: 100 align:#right
		colorpicker cp_VertIndex color:[255,128,128] across:2 fieldwidth:20 modal:false toolTip:"Color of Vertex Index Text"
		checkbutton chkb_vertIndex "Vertex Index" toolTip: "Show Vertex Index" width: 100 align:#right
		colorpicker cp_VertPos color:[128,255,255] across:2 fieldwidth:20 modal:false toolTip:"Color of Vertex Position Text"
		checkbutton chkb_vertPos "Vertex Position" toolTip: "Show Vertex Position" width: 100 align:#right
		button btn_Reset "Reset Settings" width:150
		
		-- When pressing "Object Name"
		on chkb_objName changed objNameState do
		(
			objNameCol = cp_ObjName.color
			if objNameState then
			(
				chkb_objName.highlightColor = objNameCol
				RegisterRedrawViewsCallback ViewportObjName
			)
			if objNameState != true then
			(
				UnregisterRedrawViewsCallback ViewportObjName
			)
			gw.updateScreen()
		)
		
		-- When pressing "Object Position"
		on chkb_objPos changed objPosState do
		(
			objPosCol = cp_ObjPos.color
			if objPosState then
			(
				chkb_objPos.highlightColor = objPosCol
				RegisterRedrawViewsCallback ViewportObjPos
			)
			if objPosState != true do
			(
				UnregisterRedrawViewsCallback ViewportObjPos
			)
			gw.updateScreen()
		)
		
		--When pressing "Vertex Index"
		on chkb_vertIndex changed vertIndexState do
		(
			VertIndexCol = cp_VertIndex.color
			if $ != undefined then
			(
				chkb_vertIndex.highlightColor = VertIndexCol
				if vertIndexState then
				(
					RegisterRedrawViewsCallback ViewportVertexIndex
				)
				if vertIndexState != true then
				(
					UnregisterRedrawViewsCallback ViewportVertexIndex
					chkb_vertIndex.text = "Vertex Index"
				)
			)
			if $ == undefined then
			(
				if vertIndexState then
				(
					print "Undefined! Select an Object"
					chkb_vertIndex.highlightColor = red
					chkb_vertIndex.text = "no object selected!"
				)
				if vertIndexState != true then
				(
					chkb_vertIndex.text = "Vertex Index"
				)
			)		
			gw.updateScreen()
		)
		
		-- When pressing "Vertex Position"
		on chkb_vertPos changed vertPosState do
		(
			VertPosCol = cp_VertPos.color
			if $ != undefined then
			(
				chkb_vertPos.highlightColor = VertPosCol
				if vertPosState then
				(
					RegisterRedrawViewsCallback ViewportVertexPos
				)
				if vertPosState != true then
				(
					UnregisterRedrawViewsCallback ViewportVertexPos
					chkb_vertPos.text = "Vertex Position"
				)
			)
			
			if $ == undefined then
			(
				if vertPosState then
				(
					print "Undefined! Select an Object"
					chkb_vertPos.highlightColor = red
					chkb_vertPos.text = "No object selected!"
				)
				if vertPosState != true then
				(
					chkb_vertPos.text = "Vertex Position"
				)
			)
		)
		
		on btn_Reset pressed do
		(
			cp_ObjName.color = color 128 128 255
			cp_ObjPos.color = color 128 255 128
			cp_VertIndex.color = color 255 128 128
			cp_VertPos.color = color 128 255 255
		)
	)
	CreateDialog ExtraInfo autoLayoutOnResize:true
	AddSubRollout ExtraInfo.buttonrollout buttons
	ExtraInfo.buttonrollout.height += 300
)