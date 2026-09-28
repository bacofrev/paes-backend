import LessonView from "../../../../../LessonView";

export default async function Page(props: PageProps<"/cursos/[curso]/clases/[clase]">) {
  const { curso, clase } = await props.params;
  return (
    <LessonView
      courseCode={decodeURIComponent(curso)}
      lessonCode={decodeURIComponent(clase)}
    />
  );
}
