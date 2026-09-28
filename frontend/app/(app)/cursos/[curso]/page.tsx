import CourseView from "../../../CourseView";

export default async function Page(props: PageProps<"/cursos/[curso]">) {
  const { curso } = await props.params;
  return <CourseView courseCode={decodeURIComponent(curso)} />;
}
