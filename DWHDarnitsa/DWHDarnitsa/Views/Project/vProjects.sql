CREATE VIEW project.[vProjects]
	AS 
		SELECT 
			p.[ИДПроекта]
			,p.[ОписаниеТипаКорпоративногоПроекта]
			,p.[ИдентификаторТипаКорпоративногоПроекта]
			,p.[КорпоративныйТипПроектаЯвляетсяСтандартным]
			,p.[TypeNameКорпоративногоПроекта]
			,p.[ИДРодительскогоПроекта]
			,p.[ФактическиеЗатратыПроекта]
			,p.[ФактическаяДлительностьПроекта]
			,p.[ФактическаяДатаОкончанияПроекта]
			,p.[ФактическиеЗатратыНаСверхурочныеПроекта]
			,p.[ФактическиеСверхурочныеТрудозатратыПроекта]
			,p.[ФактическиеОбычныеТрудозатратыПроекта]
			,p.[ФактическаяДатаНачалаПроекта]
			,p.[ФактическиеТрудозатратыПроекта]
			,p.[ИмяКомпанииПроекта]
			,p.[ДатаСозданияПроекта]
			,p.[ВалютаПроекта]
			,p.[ДлительностьПроекта]
			,p.[ОтклонениеДлительностиПроекта]
			,p.[РаннееОкончаниеПроекта]
			,p.[РаннееНачалоПроекта]
			,p.[ОсвоенныеОбъемыПроектаУстарели]
			,p.[ProjectEnterpriseFeatures]
			,p.[ДатаОкончанияПроекта]
			,p.[ОтклонениеОкончанияПроекта]
			,p.[ФиксированныеЗатратыПроекта]
			,p.[ProjectIdentifier]
			,p.[ПозднееОкончаниеПроекта]
			,p.[ПозднееНачалоПроекта]
			,p.[ProjectLastPublishedDate]
			,p.[РуководительПроекта]
			,p.[ДатаИзмененияПроекта]
			,p.[ИмяПроекта]
			,p.[СверхурочныеЗатратыПроекта]
			,p.[СверхурочныеТрудозатратыПроекта]
			,p.[ИДВладельцаПроекта]
			,p.[ОтветственныйЗаПроект]
			,p.[ПроцентЗавершенияПроекта]
			,p.[ПроцентЗавершенияПроектаПоТрудозатратам]
			,p.[ОбычныеЗатратыПроекта]
			,p.[ОбычныеТрудозатратыПроекта]
			,p.[ТрудозатратыПланаРесурсовПроекта]
			,p.[ДатаНачалаПроекта]
			,p.[ОтклонениеНачалаПроекта]
			,p.[ДатаОтчетаОСостоянииПроекта]
			,p.[ТемаПроекта]
			,p.[ОКПпроекта]
			,p.[ООКПпроекта]
			,p.[ПЭВпроекта]
			,p.[ЗаголовокПроекта]
			,p.[ТипПроекта]
			,p.[ОПЗпроекта]
			,p.[ТрудозатратыПроекта]
			,p.[ВнутреннийURL_АдресРабочейОбластиПроекта]
			,p.[РасхождениеТрудозатратПроекта]
			,p.[ТипИспользованияПланаРесурса]
			,p.[Отделыпроекта]
			,p.[IndDurVprj]
			,p.[IndStartVprj]
			,p.[IndFinishVprj]
			,p.[Кодпроекту]
			,p.[Архів]
			,p.[Етаппроектупоточний]
			,p.[Статуспроекту]
			,p.[КодАТС]
			,p.[БЮ]
			,p.[SKU]
			,bp.[БазоваяДатаОкончанияПроекта]
			,bp.[БазоваяДлительностьПроекта]

		FROM [Project].[Projects] p
			join project.baseprojects bp on bp.[идпроекта] = p.[идпроекта]
		where isnull(p.[Архів], 0) <> 1 and bp.[БазовыйНомер] = 0
